import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        url: String
    }

    click(event) {
        var url = this.urlValue
        if (event.altKey) {
            url += "&flag=true"
        }
        Turbo.visit(url)
    }
}
