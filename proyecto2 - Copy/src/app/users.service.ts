import { Injectable } from "@angular/core";
import {ContadorService} from "./counter.service";

@Injectable()

export class UsersService {

    activeUsers = ['Max', 'Anna'];
    inactiveUsers = ['Chris', 'Manu'];
//contador: number;
contador = 0;

constructor (private contadorService: ContadorService) {}

    setToInactive(id: number) {
      this.inactiveUsers.push(this.activeUsers[id]);
      this.activeUsers.splice(id, 1);
      this.contadorService.AumentarNumero();
      
    }

    setToActive(id: number) {
      this.activeUsers.push(this.inactiveUsers[id]);
      this.inactiveUsers.splice(id, 1);
    }
}
