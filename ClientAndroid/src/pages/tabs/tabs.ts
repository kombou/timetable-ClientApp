import {Component} from "@angular/core";
import {ModulePage} from "../module/module";
import {SettingsPage} from "../settings/settings";

@Component({
  selector: 'app-tabs',
  templateUrl: 'tabs.html'
})
export class TabsPage {
  modulePage: any = ModulePage;
  settingsPage: any = SettingsPage;
}
