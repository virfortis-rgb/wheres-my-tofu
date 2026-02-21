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
      center: [139.6917, 35.6895],
      zoom: 12
    })

    map.addControl(new mapboxgl.NavigationControl())

    const bounds = new mapboxgl.LngLatBounds()

    this.storesValue.forEach(store => {
      const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(
        `<strong>${store.name}</strong><br><span style="font-size:0.8rem;color:#666">${store.address}</span>`
      )

      new mapboxgl.Marker({ color: "#1EDD88" })
        .setLngLat([store.longitude, store.latitude])
        .setPopup(popup)
        .addTo(map)

      bounds.extend([store.longitude, store.latitude])
    })

    if (this.storesValue.length > 0) {
      map.fitBounds(bounds, { padding: 60, maxZoom: 15 })
    }
  }
}
