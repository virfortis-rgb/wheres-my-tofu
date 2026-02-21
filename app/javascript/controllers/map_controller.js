import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    token: String,
    stores: Array
  }

  connect() {
    const mapboxgl = window.mapboxgl
    mapboxgl.accessToken = this.tokenValue

    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [135.4547, 34.6776],
      zoom: 12
    })

    map.addControl(new mapboxgl.NavigationControl())

    const bounds = new mapboxgl.LngLatBounds()

    this.storesValue.forEach((store, index) => {
      const popup = new mapboxgl.Popup({ offset: 30 }).setHTML(
        `<strong>${store.name}</strong><br><span style="font-size:0.8rem;color:#666">${store.address}</span>`
      )

      // Numbered marker showing visit order
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
      el.textContent = index + 1

      new mapboxgl.Marker({ element: el })
        .setLngLat([store.longitude, store.latitude])
        .setPopup(popup)
        .addTo(map)

      bounds.extend([store.longitude, store.latitude])
    })

    if (this.storesValue.length > 0) {
      map.fitBounds(bounds, { padding: 70, maxZoom: 15 })
    }

    if (this.storesValue.length > 1) {
      map.on('load', () => this.drawRoute(map))
    }
  }

  async drawRoute(map) {
    const coords = this.storesValue
      .map(s => `${s.longitude},${s.latitude}`)
      .join(';')

    try {
      const res = await fetch(
        `https://api.mapbox.com/directions/v5/mapbox/driving/${coords}?geometries=geojson&overview=full&access_token=${this.tokenValue}`
      )
      const data = await res.json()

      if (!data.routes || data.routes.length === 0) return

      const geometry = data.routes[0].geometry

      // White casing underneath for contrast
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
    } catch (e) {
      console.error('Route fetch failed:', e)
    }
  }
}
