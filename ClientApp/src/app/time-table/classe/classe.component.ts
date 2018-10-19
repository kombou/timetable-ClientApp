import {Component} from '@angular/core';
import {Classe} from '../../models/Classe';
import {Class} from '../classe';
import {Time} from '../../models/Time';
import {TimeTableRepository} from '../time-table.repository';


@Component({
  selector: 'app-classe',
  templateUrl: 'classe.component.html'
})
export class ClasseComponent {
  current: Classe;
  timeTable = [];
  timeLundi = [];
  timeMardi = [];
  timeMercredi = [];
  timeJeudi = [];
  timeVendredi = [];
  timeSamedi = [];

  constructor(private classe: Class, private repository: TimeTableRepository) {
    this.classe.classe.subscribe(c => {
      console.log(this.current);
    });
    this.repository.list(this.current).subscribe(l => {
      this.timeTable = l
      const group = this.groupBy(l, pet => pet.idjourNavigation.nom);
      this.timeLundi = group.get('LUNDI');
      this.timeMardi = group.get('MARDI');
      this.timeMercredi = group.get('MERCREDI');
      this.timeJeudi = group.get('JEUDI');
      this.timeVendredi = group.get('VENDREDI');
      this.timeSamedi = group.get('SAMEDI');
    });
  }
groupBy(list, keyGetter) {
    const map = new Map();
    list.forEach((item) => {
      const key = keyGetter(item);
      const collection = map.get(key);
      if (!collection) {
        map.set(key, [item]);
      } else {
        collection.push(item);
      }
    });
    return map;
  }
}
