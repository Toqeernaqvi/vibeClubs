import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "suggestions" ]

  fetchCities() {
    let input = this.inputTarget
    let ul = this.suggestionsTarget
    //let ul = document.getElementById('suggestions')
    fetch(`/autocomplete?city=${input.value}`)
    .then(response => response.json())
    .then((data) => {
      ul.innerHTML = ""
      if ( input.value == "" ) {
        $("#search-input").css("border-bottom-left-radius", "7px")
        $("#search-input").css("border-bottom-right-radius", "7px")
    
        return ''
      } else {
        $("#search-input").css("border-bottom-left-radius", "0px")
        $("#search-input").css("border-bottom-right-radius", "0px")
        data.cities.forEach((city) => {
        let li = `<a href="/clubs?city=${city.name}">
                  <li><i class="fa fa-search fa-1x ml-1" style="margin-right: 3px;"></i>${city.name}</li></a>`
        ul.insertAdjacentHTML('beforeend', li)
      })
      }
    })
  }

}
