using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AsynchronousModelBindingExample.Models
{
	public class Widget
	{
		public Guid WidgetID { get; set; }
		public string Name { get; set; }
		public IEnumerable<WidgetPart> Parts { get; set; }
	}

	public class WidgetPart
	{
		public Guid WidgetPartID { get; set; }
		public Guid WidgetID { get; set; }
		public string Description { get; set; }
		public bool IsFunctioning { get; set; }
	}
}