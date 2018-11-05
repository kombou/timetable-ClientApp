import {Component} from "@angular/core";
import {MenuController} from "ionic-angular";

@Component({
  selector: 'page-module',
  templateUrl: 'module.html'
})
export class ModulePage {

  constructor(public menuCtrl: MenuController)  {}
  onToggleMenu() {
    this.menuCtrl.open();
  }
}
