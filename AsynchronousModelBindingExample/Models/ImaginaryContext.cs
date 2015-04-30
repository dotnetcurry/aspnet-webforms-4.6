using System.Data.Entity;

namespace AsynchronousModelBindingExample.Models
{
	public class ImaginaryContext : DbContext
	{
		public DbSet<Widget> Widgets { get; set; }
	}
}