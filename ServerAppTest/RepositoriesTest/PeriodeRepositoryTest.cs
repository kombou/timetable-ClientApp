using ServerApp.entity;
using ServerApp.Models;
using NodaTime;
using ServerApp.Repositories.Implementations;
using System;
using System.Collections.Generic;
using System.Text;
using Xunit;

namespace ServerAppTest.RepositoriesTest
{
    public class PeriodeRepositoryTest
    {

        [Fact]
        public void OverLap()
        {
            ModelPeriode modelCompare = new ModelPeriode();
            ModelPeriode model = new ModelPeriode();

            modelCompare.Debut = new LocalTime(10, 30);
            modelCompare.Fin = new LocalTime(12, 30);
            modelCompare.Jour = DayOfWeek.Monday;

            model.Debut = new LocalTime(09, 30);
            model.Fin = new LocalTime(12, 30);
            model.Jour = DayOfWeek.Monday;


            Assert.True(model.OverLap(modelCompare));
        }
    }
}
