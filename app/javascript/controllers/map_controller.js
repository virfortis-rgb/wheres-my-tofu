import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    token: String,
    stores: Array,
    allSelected: Boolean
  }

  connect() {
    const mapboxgl = window.mapboxgl
    mapboxgl.accessToken = this.tokenValue

    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/standard",
      center: [135.4547, 34.6776],
      zoom: 12,
      pitch: 60,
      bearing: 0,
      interactive: true
    })

    map.addControl(new mapboxgl.NavigationControl())

    if (this.storesValue.length === 1) {
      this.addMarker(map, this.storesValue[0], 1)
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([this.storesValue[0].longitude, this.storesValue[0].latitude])
      map.fitBounds(bounds, { padding: 70, maxZoom: 15 })
    } else if (this.storesValue.length > 1) {
      map.on('load', () => this.optimizeRouteAndAnimate(map, this.allSelectedValue))
    }
  }

  addMarker(map, store, number) {
    const mapboxgl = window.mapboxgl
    const popup = new mapboxgl.Popup({ offset: 30 }).setHTML(
      `<strong>${store.name}</strong><br><span style="font-size:0.8rem;color:#666">${store.address}</span>`
    )
    const el = document.createElement('div')
    el.style.cssText = `
      background: #266533;
      color: white;
      width: 30px;
      height: 30px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 700;
      font-size: 0.85rem;
      border: 2.5px solid white;
      box-shadow: 0 2px 8px rgba(0,0,0,0.35);
      cursor: pointer;
    `
    el.textContent = number
    new mapboxgl.Marker({ element: el })
      .setLngLat([store.longitude, store.latitude])
      .setPopup(popup)
      .addTo(map)
  }

  async optimizeRouteAndAnimate(map, shouldAnimate) {
    const mapboxgl = window.mapboxgl
    const coords = this.storesValue
      .map(s => `${s.longitude},${s.latitude}`)
      .join(';')

    try {
      // Optimization API — finds the shortest visit order
      const res = await fetch(
        `https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coords}` +
        `?source=first&destination=last&roundtrip=false&overview=full&geometries=geojson&access_token=${this.tokenValue}`
      )
      const data = await res.json()

      if (!data.trips || data.trips.length === 0) return

      // Remap stores into the optimized visit order
      // data.waypoints[i] = input store i, .waypoint_index = its position in optimized trip
      const optimizedStores = new Array(this.storesValue.length)
      data.waypoints.forEach((wp, inputIndex) => {
        optimizedStores[wp.waypoint_index] = this.storesValue[inputIndex]
      })

      // Place numbered markers in optimized order
      const bounds = new mapboxgl.LngLatBounds()
      optimizedStores.forEach((store, i) => {
        this.addMarker(map, store, i + 1)
        bounds.extend([store.longitude, store.latitude])
      })

      map.fitBounds(bounds, { padding: 70, maxZoom: 15 })

      const geometry = data.trips[0].geometry

      map.addSource('route', {
        type: 'geojson',
        data: { type: 'Feature', properties: {}, geometry }
      })
      map.addLayer({
        id: 'route-casing',
        type: 'line',
        source: 'route',
        layout: { 'line-join': 'round', 'line-cap': 'round' },
        paint: { 'line-color': '#ffffff', 'line-width': 8, 'line-opacity': 0.7 }
      })
      map.addLayer({
        id: 'route-line',
        type: 'line',
        source: 'route',
        layout: { 'line-join': 'round', 'line-cap': 'round' },
        paint: { 'line-color': '#266533', 'line-width': 4, 'line-opacity': 0.9 }
      })

      if (shouldAnimate) {
        setTimeout(() => this.animateCamera(map, geometry.coordinates, bounds), 1200)
      }
    } catch (e) {
      console.error('Route optimization failed:', e)
    }
  }

  animateCamera(map, routeCoords, bounds) {
    const turf = window.turf
    if (!turf) return

    const mapboxgl = window.mapboxgl
    const animationDuration = 20000
    const cameraAltitude = 350

    const routeLine = turf.lineString(routeCoords)
    const routeDistance = turf.lineDistance(routeLine)

    let start
    let animationId

    const stopAnimation = () => {
      if (animationId) cancelAnimationFrame(animationId)
      map.off('mousedown', stopAnimation)
      map.off('touchstart', stopAnimation)
    }
    map.on('mousedown', stopAnimation)
    map.on('touchstart', stopAnimation)

    const showOverview = () => {
      map.fitBounds(bounds, {
        padding: 80,
        maxZoom: 15,
        pitch: 0,
        bearing: 0,
        duration: 2500
      })
    }

    const frame = (time) => {
      if (!start) start = time
      const phase = Math.min((time - start) / animationDuration, 1)

      const along = turf.along(routeLine, routeDistance * phase).geometry.coordinates
      const lookAhead = turf.along(routeLine, routeDistance * Math.min(phase + 0.015, 1)).geometry.coordinates

      const camera = map.getFreeCameraOptions()
      camera.position = mapboxgl.MercatorCoordinate.fromLngLat(
        { lng: along[0], lat: along[1] },
        cameraAltitude
      )
      camera.lookAtPoint({ lng: lookAhead[0], lat: lookAhead[1] })
      map.setFreeCameraOptions(camera)

      if (phase < 1) {
        animationId = window.requestAnimationFrame(frame)
      } else {
        setTimeout(showOverview, 600)
      }
    }

    animationId = window.requestAnimationFrame(frame)
  }
}
