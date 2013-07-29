//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace CloudEDUServer
{
    using System;
    using System.Collections.Generic;
    
    public partial class CUSTOMER
    {
        public CUSTOMER()
        {
            this.COMMENTs = new HashSet<COMMENT>();
            this.COURSEs = new HashSet<COURSE>();
            this.ATTENDs = new HashSet<ATTEND>();
            this.NOTEs = new HashSet<NOTE>();
            this.SALEORDERs = new HashSet<SALEORDER>();
            this.SALEORDERs1 = new HashSet<SALEORDER>();
            this.COURSEs1 = new HashSet<COURSE>();
        }
    
        public int ID { get; set; }
        public string NAME { get; set; }
        public string PASSWORD { get; set; }
        public decimal BALANCE { get; set; }
        public string EMAIL { get; set; }
        public string DEGREE { get; set; }
        public Nullable<double> LEARN_RATE { get; set; }
        public Nullable<double> TEACH_RATE { get; set; }
        public System.DateTime BIRTHDAY { get; set; }
    
        public virtual ICollection<COMMENT> COMMENTs { get; set; }
        public virtual ICollection<COURSE> COURSEs { get; set; }
        public virtual ICollection<ATTEND> ATTENDs { get; set; }
        public virtual ICollection<NOTE> NOTEs { get; set; }
        public virtual ICollection<SALEORDER> SALEORDERs { get; set; }
        public virtual ICollection<SALEORDER> SALEORDERs1 { get; set; }
        public virtual ICollection<COURSE> COURSEs1 { get; set; }
    }
}
