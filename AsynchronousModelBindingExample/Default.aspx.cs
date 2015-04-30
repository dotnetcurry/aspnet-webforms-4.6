using AsynchronousModelBindingExample.Models;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace AsynchronousModelBindingExample
{
	public partial class Default : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		public async Task<SelectResult> GetWidgets()
		{
			// Create your data context to access your data (replace with your existing context
			// in your real-world application)
			using (var context = new ImaginaryContext())
			{
				// Build a query to pull your widgets (including the Parts related to each Widget)
				var query = context.Widgets.Include("Parts");
				// Return a SelectResult to bind the data to the GridView (using the asyncronous 
				// ToListAsync() method exposed by Entity Framework)
				return new SelectResult(query.Count(), await query.ToListAsync());
			}
		}

		public async Task UpdateWidget(Guid widgetId, CancellationToken token)
		{
			using (var context = new ImaginaryContext())
			{
				// Attempt to retrieve your current Widget through the context
				var widget = await context.Widgets.FirstAsync(w => w.WidgetID == widgetId);

				// Check if the requested Widget was found
				if (widget != null)
				{
					// Update your Widget here, adding any custom logic as necessary
					TryUpdateModel(widget);
					// Ensure the model is valid, if so update and save the Widget
					if (ModelState.IsValid)
					{
						await context.SaveChangesAsync();
					}
				}
				// Otherwise, the widget was not found, display an error to the user
				ModelState.AddModelError("", $"The Widget with ID '{widgetId}' was not found");
			}
		}

		public async Task DeleteWidget(Guid widgetId, CancellationToken token)
		{
			using (var context = new ImaginaryContext())
			{
				// Attempt to retrieve your current Widget through the context
				var widget = await context.Widgets.FirstAsync(w => w.WidgetID == widgetId);

				// Check if the requested Widget was found
				if (widget != null)
				{
					// Delete the requested Widget
					context.Widgets.Remove(widget);
					await context.SaveChangesAsync();
				}
				// Otherwise, the widget was not found, display an error to the user
				ModelState.AddModelError("", $"The Widget with ID '{widgetId}' was not found");
			}
		}
	}
}