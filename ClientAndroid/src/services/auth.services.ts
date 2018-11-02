import {HttpClient} from "@angular/common/http";
import {Compte} from "../models/Compte";
import {Injectable} from "@angular/core";
import {SERVER_URL} from "../models/Serveur";

@Injectable()
export class AuthServices {
  url = `${SERVER_URL}/api/comptes`;
  isAuth: boolean;

  constructor(public httpClient: HttpClient) {
  }

  createEnseignant(user: Compte) {
    return new Promise((resolve, reject) => {
      this.httpClient.post(`${this.url}/create`, user)
        .subscribe(user => {
          resolve(user);
        }, err => {
          reject(err);
        })
    });
  }
  signInUser(matricule: string, password: string) {
    return new Promise((resolve, reject) => {
      this.httpClient.post(this.url, {matricule: matricule, passhash: password})
        .subscribe(user => {
          resolve(user);
        }, err => {
          reject(err);
        })
    });
  }

  signOut() {
    return new Promise((resolve, reject) => {
      this.httpClient.get(this.url).subscribe(() =>  {
        resolve("ok");
      },err => {
        reject(err);
      })
    });
  }

  getSession() {
    return new Promise((resolve,reject) => {
      this.httpClient.get(`${this.url}/session`).subscribe(user => {
        resolve(user);
      }, err => {
        reject(err);
      })
    });
  }

}
