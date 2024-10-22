using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Technical_Test.Model
{
    public class BaseModel
    {
        public string ConnectionString { get; set; }
        public string SpName { get; set; }
        public string WhereCond { get; set; }
        public string Message { get; set; }
        public DataTable DtResult { get; set; }
        public DataTable DtResult1 { get; set; }

        public Dictionary<string, object> spParameter { get; set; }
    }
}