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

  constructor(private classe: Class, private repository: TimeTableRepository) {
    this.classe.classe.subscribe(c => {
      console.log(this.current + "ffffff");
    });
    this.repository.list(this.current).subscribe(l => {
      this.timeTable = l;
    });
  }
}
