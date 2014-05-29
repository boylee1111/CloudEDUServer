using System;
using System.Data.Entity;
using System.Linq;

namespace CloudEDUServer
{
    public class CustomerAccess
    {
        private static CloudEDUEntities ctx = new CloudEDUEntities();

        public static CUSTOMER[] GetAllCustomers()
        {
            return ctx.CUSTOMERs.ToArray();
        }

        public static CUSTOMER GetCustomerByID(int customer_id)
        {
            return ctx.CUSTOMERs.Where(c => c.ID == customer_id).FirstOrDefault();
        }

        public static bool UpdateCustomer(CUSTOMER customer)
        {
            try
            {
                ctx.Entry(customer).State = EntityState.Modified;
                ctx.SaveChanges();
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e);
                return false;
            }
            return true;
        }
    }
}