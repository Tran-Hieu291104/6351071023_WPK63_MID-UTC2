using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1.UserControl
{
    public partial class ucManageProduct : System.Web.UI.UserControl
    {

        protected void BindGridView()
        {
            // phương thức trên dùng linq để lấy dữ liệu trong CSDL và gán dữ liệu đó vào gridView
            QLKhoaHocEntities context = new QLKhoaHocEntities();
            var query = (from p in context.Courses select p).ToList<Course>();
            GridViewProducts.DataSource = query;
            GridViewProducts.DataBind();// cập nhập dữ liệu trên UI
        }

        protected void BindDropDownList()
        {
            QLKhoaHocEntities context = new QLKhoaHocEntities();
            DropDownListCategory.DataSource = (from c in context.Categories select c).ToList<Category>();
            DropDownListCategory.DataTextField = "CatName";
            DropDownListCategory.DataValueField = "CatID";
            DropDownListCategory.DataBind();

            dpEditProductCategory.DataSource = (from c in context.Categories select c).ToList<Category>();
            dpEditProductCategory.DataTextField = "CatName";
            dpEditProductCategory.DataValueField = "CatID";
            dpEditProductCategory.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindDropDownList();
            }
        }

        protected void GridViewProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        // Khi người dùng chọn một trang khác trong GridView, sự kiện này sẽ được kích hoạt.
        {
            GridViewProducts.PageIndex = e.NewPageIndex; // Cập nhật chỉ số trang mới
            // NewPageIndex cho biết chỉ số của trang mà người dùng đã chọn
            BindGridView(); // Gọi phương thức để làm mới dữ liệu hiển thị trong GridView
        }
        protected void GridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        // được kích hoạt khi ng dùng nhấn vào nút delete hoặc edit hoặc ... 
        {
            int id = int.Parse(e.CommandArgument.ToString());
            // CommandArgument chứa giá trị ID của sản phẩm mà người dùng đã chọn để chỉnh sửa hoặc xóa.
            QLKhoaHocEntities context = new QLKhoaHocEntities();

            if (e.CommandName == "EditProduct")
            {
                var product = (from p in context.Courses
                               where p.ID == id
                               select p).SingleOrDefault();
                if (product != null)
                // nếu sp có tồn tại thì gán tất cả thông tin hiện tại của sp đó vào khu vực form cập nhập, sau đó hiện form cập nhập; vì mặc định form (pnlEditProduct) ẩn
                {
                    lblProductId.Text = product.ID.ToString(); // Ghi lại ID để cập nhật
                    txtEditProductName.Text = product.Name;
                    txtEditProductPrice.Text = product.Duration.ToString();
                    txtEditProductDescription.Text = product.Description;
                    dpEditProductCategory.SelectedValue = product.CatID.ToString();
                    pnlEditProduct.Visible = true; // Hiện form cập nhật
                }
            }
            else if (e.CommandName == "DeleteProduct")
            {
                var product = (from p in context.Courses
                               where p.ID == id
                               select p).SingleOrDefault();
                // nếu sp tồn tại thì xóa ngay lập tức, sau đó gọi phương thức SaveChanges để lưu dữ liệu (vì linq bắt buộc, nếu ko gọi thì xóa ko thành công)

                if (product != null)
                {
                    context.Courses.Remove(product);
                    context.SaveChanges();
                    BindGridView();
                    Page.Master.DataBind(); // Cập nhật lại dữ liệu cho master page nếu cần
                }
            }
        }

        protected void ButtonAddNew_Click(object sender, EventArgs e)
        {
            string fileName = "";
            if (FileUploadPicture.HasFile)
            {
                fileName = FileUploadPicture.FileName; // Lấy tên tệp hình ảnh
                FileUploadPicture.SaveAs(Server.MapPath("~/images/Products/" + fileName)); // Lưu hình ảnh lên server
            }

            QLKhoaHocEntities context = new QLKhoaHocEntities();
            Course p = new Course();
            // Không cần gán giá trị cho ProductID nếu nó là cột tự động tăng (identity)
            p.Name = TextBoxName.Text;
            p.Duration = int.Parse(txtEditProductPrice.Text);
            p.Description = TextBoxDescription.Text;
            p.CatID = int.Parse(dpEditProductCategory.SelectedValue);
            p.ImageFilePath = fileName;

            context.Courses.Add(p); // Thêm sản phẩm mới vào Products trong CSDL
            context.SaveChanges();

            BindGridView(); // Cập nhật lại dữ liệu trong GridView
            Page.Master.DataBind(); // Cập nhật lại dữ liệu cho master page nếu cần
        }



        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            QLKhoaHocEntities context = new QLKhoaHocEntities();
            int productId = int.Parse(lblProductId.Text);  // lấy idProduct của sp mà ng dùng nhập
            var product = (from p in context.Courses
                           where p.ID == productId
                           select p).SingleOrDefault();
            // lấy cái đó tìm trong CSDL xem có hay ko

            if (product != null)
            {
                product.Name = txtEditProductName.Text;
                product.Duration = int.Parse(txtEditProductPrice.Text);
                product.Description = txtEditProductDescription.Text;
                product.CatID = int.Parse(dpEditProductCategory.SelectedValue);

                // Kiểm tra nếu có file ảnh mới
                if (fulEditImageProduct.HasFile)
                {
                    string fileName = fulEditImageProduct.FileName;
                    fulEditImageProduct.SaveAs(Server.MapPath("~/images/Courses/" + fileName));
                    product.ImageFilePath = fileName; // Cập nhật đường dẫn file
                }

                context.SaveChanges(); // Lưu các thay đổi
                BindGridView(); // Cập nhật lại GridView
                pnlEditProduct.Visible = false; // Ẩn form cập nhật
                Page.Master.DataBind();
            }
        }

        protected void btnCancelUpdate_Click(object sender, EventArgs e)
        {
            pnlEditProduct.Visible = false; // Ẩn form cập nhật
        }
    }
}