﻿using Microsoft.EntityFrameworkCore;
using ServerApp.entity;
using ServerApp.Repositories.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServerApp.Repositories.Implementations
{
    public abstract class Repository<T, ID> : IRepository<T, ID> where T : class
    {
        public abstract DbSet<T> Collections { get; }

        protected bd_timetableContext context;

        public Repository(bd_timetableContext context)
        {
            this.context = context;
        }

        public virtual T this[ID id]
        {
            get
            {
                T obj = Collections.Find(id);
                return obj;
            }
        }

        public void Delete(T obj)
        {
            Collections.Remove(obj);
            context.SaveChanges();
        }

        public virtual IEnumerable<T> List()
        {
            return Collections.ToArray();
        }

        public T Save(T obj)
        {
            T saveObj = Collections.Add(obj).Entity;
            context.SaveChanges();
            return saveObj;
        }

        public T Update(T obj)
        {
            T updateObj = Collections.Update(obj).Entity;
            context.SaveChanges();
            return updateObj;
        }
    }
}
