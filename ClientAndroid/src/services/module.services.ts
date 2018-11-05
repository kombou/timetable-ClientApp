import {Injectable} from "@angular/core";
import {SERVER_URL} from "../models/Serveur";

@Injectable()
export class ModuleServices {
  url = `${SERVER_URL}/api/modules`;
}
