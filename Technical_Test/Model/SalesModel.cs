using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Technical_Test.Model
{
    public class SalesModel : BaseModel
    {
        public int SO_ORDER_ID { get; set; }
        public string ORDER_NO { get; set; }
        public string ORDER_DATE { get; set; }
        public int CUSTOMER_ID { get; set; }
        public string CUSTOMER_NAME { get; set; }
        public string ADDRESS { get; set; }

        public DataTable dtDetail { get; set; }
    }

    public class OrderModel : BaseModel
    {
        public int ITEM_ID { get; set;}
        public string ITEM_NAME { get; set;}
        public int QUANTITY { get; set; }
        public float PRICE { get; set; }
    }
}