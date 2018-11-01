import {HttpClient} from "@angular/common/http";
import {Compte} from "../models/Compte";
import {Injectable} from "@angular/core";

@Injectable()
export class AuthServices {
  url = 'http://localhost:5000/api/comptes';

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
      this.httpClient.post(this.url, {matricule: matricule, password: password})
        .subscribe(user => {
          resolve(user);
        }, err => {
          reject(err);
        })
    });
  }

  signOut() {
    return new Promise((resolve, reject) => {
      this.httpClient.get(this.url).subscribe(user =>  {
        resolve(user);
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
