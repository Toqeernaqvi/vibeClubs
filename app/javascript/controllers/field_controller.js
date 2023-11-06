import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'countries', 'cities' ];

  changeField() {
    const cityId = this.citiesTarget
    const countryId = this.countriesTarget
    let url = `/countries/${this.countriesTarget.value}.json`
    fetch(url)
    .then(response => response.json())
    .then((data) => {
     cityId.innerHTML = ""
      data.cities.forEach(city => {
        let option = `<option value="${city.id}">${city.name}</option>`
        cityId.insertAdjacentHTML('beforeend', option)
      })
    })
  }

}
