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
    
    public partial class ATTEND
    {
        public int CUSTOMER_ID { get; set; }
        public int COURSE_ID { get; set; }
        public System.DateTime START_TIME { get; set; }
        public Nullable<int> CURRENT_LESSON { get; set; }
    
        public virtual COURSE COURSE { get; set; }
        public virtual LESSON LESSON { get; set; }
        public virtual CUSTOMER CUSTOMER { get; set; }
    }
}
