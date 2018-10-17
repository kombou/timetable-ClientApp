import {HttpClient} from '@angular/common/http';
import {Classe} from '../models/Classe';
import {Injectable} from '@angular/core';

@Injectable()
export class ClasseRepository {
  url = 'http://localhost:5000/api/classes';

  constructor(private httpClient: HttpClient) {}

  List() {
    return this.httpClient.get<Classe[]>(this.url);
  }
  findById(id: number) {
    return this.httpClient.get<Classe>(`${this.url}/${id}`);
  }
}
