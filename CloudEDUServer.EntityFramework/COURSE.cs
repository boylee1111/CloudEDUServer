//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CloudEDUServer
{
    using System;
    using System.Collections.Generic;
    
    public partial class COURSE
    {
        public COURSE()
        {
            this.COMMENTs = new HashSet<COMMENT>();
            this.SALEORDERs = new HashSet<SALEORDER>();
            this.ATTENDs = new HashSet<ATTEND>();
            this.LESSONs = new HashSet<LESSON>();
            this.RECOMMENDATIONs = new HashSet<RECOMMENDATION>();
            this.CUSTOMERs = new HashSet<CUSTOMER>();
        }
    
        public int ID { get; set; }
        public decimal PRICE { get; set; }
        public Nullable<double> RATE { get; set; }
        public string TITLE { get; set; }
        public string INTRO { get; set; }
        public int TEACHER { get; set; }
        public Nullable<int> CATEGORY { get; set; }
        public string COURSE_STATUS { get; set; }
        public Nullable<int> PG { get; set; }
        public string ICON_URL { get; set; }
        public System.DateTime START_TIME { get; set; }
    
        public virtual CATEGORY CATEGORY1 { get; set; }
        public virtual ICollection<COMMENT> COMMENTs { get; set; }
        public virtual ICollection<SALEORDER> SALEORDERs { get; set; }
        public virtual ICollection<ATTEND> ATTENDs { get; set; }
        public virtual PARENT_GUIDE PARENT_GUIDE { get; set; }
        public virtual CUSTOMER CUSTOMER { get; set; }
        public virtual ICollection<LESSON> LESSONs { get; set; }
        public virtual ICollection<RECOMMENDATION> RECOMMENDATIONs { get; set; }
        public virtual ICollection<CUSTOMER> CUSTOMERs { get; set; }
    }
}
