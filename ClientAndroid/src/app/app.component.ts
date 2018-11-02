import {Component, ViewChild} from '@angular/core';
import {MenuController, NavController, Platform} from 'ionic-angular';
import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

import {AuthPage} from "../pages/auth/auth";
import {AuthServices} from "../services/auth.services";
import {TabsPage} from "../pages/tabs/tabs";
import {Compte} from "../models/Compte";
@Component({
  templateUrl: 'app.html'
})
export class MyApp {
  authPage: any = AuthPage;
  tabsPage: any = TabsPage;
  @ViewChild('content') content: NavController;

  isAuth: boolean;

  constructor(platform: Platform,
              statusBar: StatusBar,
              splashScreen: SplashScreen,
              public menuCtrl: MenuController,
              public authService: AuthServices) {
    platform.ready().then(() => {
      // Okay, so the platform is ready and our plugins are available.
      // Here you can do any higher level native things you might need.

      this.authService.getSession().then(user => {

        const compte: Compte = user;
        if(compte.matricule != null) {

          this.authService.isAuth = true;
          this.isAuth = true;
          this.content.setRoot(TabsPage);

        } else {

          this.authService.isAuth = false;
          this.isAuth = false;
          this.content.setRoot(AuthPage, {mode: 'connect'});
        }
      }).catch(err => {

        this.content.setRoot(AuthPage, {mode: 'connect'});

      });
      statusBar.styleDefault();
      splashScreen.hide();
    });
  }

  onDisconnect() {
    this.authService.signOut().then(()=> {
      this.authService.isAuth = false;
      this.content.setRoot(AuthPage,{mode: 'connect'});
    }).catch(err => {
      console.log('Problème de connexion');
    })
  }

  onTogglePage(page: any, data?: {}){
    this.content.setRoot(page, data ? data : null);
    this.menuCtrl.close();
  }
}

