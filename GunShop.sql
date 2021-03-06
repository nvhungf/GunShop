
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 8/7/2021 10:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/7/2021 10:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/7/2021 10:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/7/2021 10:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[trangthai] [nvarchar](250) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/7/2021 10:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/7/2021 10:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/7/2021 10:26:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[marks] [float] NOT NULL,
	[gender] [bit] NOT NULL,
	[country] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Address]) VALUES (N'hung', N'123', N'Nguyễn Văn Hùng', N'hung@gmail.com', N'0917999999', N'Hà Tây')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Address]) VALUES (N'sang', N'123', N'Đỗ Thành Sang', N'sang@gmail.com', N'0917666666', N'Long An')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Address]) VALUES (N'staff', N'123', N'Nguyễn Thị Gái', N'gai@gmail.com', N'0917888888', N'Hà Nội')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Phone], [Address]) VALUES (N'zelle', N'123', N'Nhật Tú', N'zelle@sang.com', N'0917777777', N'HCM')
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7104, N'hung', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7105, N'sang', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7106, N'zelle', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7107, N'staff', N'DIRE')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Súng Lục')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Súng Liên Thanh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Dao')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'ShotGun')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212529, 2, 1084, 250, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212530, 2, 1085, 155, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212531, 3, 1084, 250, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212532, 3, 1086, 255, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212533, 3, 1107, 50, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212534, 3, 1109, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212535, 4, 1086, 255, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212536, 4, 1087, 188, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212537, 4, 1089, 300, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212538, 5, 1084, 250, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212539, 5, 1085, 155, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212540, 6, 1086, 255, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212541, 6, 1087, 188, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212542, 6, 1089, 300, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212543, 6, 1090, 100, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212544, 6, 1093, 300, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212545, 7, 1085, 155, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212546, 7, 1086, 255, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212547, 7, 1107, 50, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212548, 7, 1109, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212549, 8, 1084, 250, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212550, 8, 1085, 155, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212551, 8, 1112, 115, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212552, 8, 1109, 1000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212553, 8, 1097, 333, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212554, 8, 1099, 666, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212555, 9, 1084, 250, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212556, 9, 1086, 255, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212557, 9, 1087, 188, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212558, 9, 1089, 300, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212559, 9, 1090, 100, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (2, N'hung', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'ha nam', N'Đã Huỷ')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (3, N'hung', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'Hà Nội', N'Đã Giao')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (4, N'hung', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'hùng', N'Đang Giao')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (5, N'hung', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'hugnf lkajdkajdkas', N'Đang Giao')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (6, N'hung', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'88 hùng vương, hà nội', N'Đã Giao')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (7, N'sang', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'sang ngu vl', N'Đang Giao')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (8, N'zelle', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N':v', N'Đang Giao')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [trangthai]) VALUES (9, N'hung', CAST(N'2021-08-07T00:00:00.000' AS DateTime), N'hung 123123123', N'Đang Giao')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1084, N'Súng Lục CP 12', N'sungluc-1.jpg', 250, CAST(N'2021-08-03' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1085, N'Súng Lục 6 Viên', N'sungluc-2.jpg', 155, CAST(N'2021-08-03' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1086, N'Súng Lục  VIP ', N'sungluc-3.jpg', 255, CAST(N'2021-08-03' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1087, N'Súng Lục K59', N'sungluc-4.jpg', 188, CAST(N'2021-08-03' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1089, N'Súng Lục P55', N'sungluc-5.jpg', 300, CAST(N'2021-08-03' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1090, N'Súng Lục A11', N'sungluc-6.jpg', 100, CAST(N'2021-08-03' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1093, N'Súng Liên Thanh SCAR', N'lienthanh-1.jpg', 300, CAST(N'2021-08-03' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1095, N'Súng Liên Thanh M416', N'lienthanh-2.jpg', 288, CAST(N'2021-08-03' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1096, N'Súng Liên Thanh M14A1', N'lienthanh-3.jpg', 388, CAST(N'2021-08-03' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1097, N'Súng Liên Thanh ABC', N'lienthanh-4.jpg', 333, CAST(N'2021-08-03' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1098, N'Súng Liên Thanh MP-5', N'lienthanh-5.jpg', 444, CAST(N'2021-08-03' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1099, N'Súng Liên Thanh AKA PUTIN', N'lienthanh-6.jpg', 666, CAST(N'2021-08-03' AS Date), 1, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1101, N'Shotgun Săn Thỏ', N'shotgun-1.jpg', 123, CAST(N'2021-08-03' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1103, N'Shotgun Săn Cáo', N'shotgun-2.jpg', 222, CAST(N'2021-08-03' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1104, N'Shotgun Săn Bò', N'shotgun-3.jpg', 312, CAST(N'2021-08-03' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1105, N'Shotgun Săn Lợn', N'shotgun-4.jpg', 543, CAST(N'2021-08-03' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1106, N'2 Khẩu Shotgun ', N'shotgun-6.jpg', 444, CAST(N'2021-08-03' AS Date), 1, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1107, N'Dao nhỏ ', N'dao-1.jpg', 50, CAST(N'2021-08-03' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1108, N'Dao nhỏ quấn dây', N'dao-2.jpg', 70, CAST(N'2021-08-03' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1109, N'Phóng Lợn Thor', N'dao-3.jpg', 1000, CAST(N'2021-08-03' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1112, N'Dao Ống  Đen', N'dao-4.jpg', 115, CAST(N'2021-08-03' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1113, N'Dao Nhật', N'dao-5.jpg', 66, CAST(N'2021-08-03' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1114, N'Dao Quắm', N'dao-6.jpg', 99, CAST(N'2021-08-03' AS Date), 1, N'1002')
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'anhntps10770@fpt.edu.vn', N'Nguyễn Tiến Anh', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'chaulnnps10835@fpt.edu.vn', N'Lê Nguyễn Ngọc Châu', 7, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'cuonglcps10817@fpt.edu.vn', N'Lý Chí Cường', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'datnvps10930@fpt.edu.vn', N'Nguyễn Vũ Đạt', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'dobps10723@fpt.edu.vn', N'Bùi Đỏ', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'ducnpps10800@fpt.edu.vn', N'Nguyễn Phúc Đức', 7, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'duytkps10303@fpt.edu.vn', N'Trần Khánh Duy', 6, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'huyntps10808@fpt.edu.vn', N'Nguyễn Thanh Huy', 4, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'khaihcps10763@fpt.edu.vn', N'Hoàng Cao Khải', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'luudpps10344@fpt.edu.vn', N'Đào Phong Lưu', 8, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'manhbdps09585@fpt.edu.vn', N'Bùi Đức Mạnh', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phatltps10691@fpt.edu.vn', N'Lê Tấn Phát', 9, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phucpbps10710@fpt.edu.vn', N'Phạm Bá Phúc', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phuongntdps09013@fpt.edu.vn', N'Nguyễn Thị Diễm Phương', 8, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'quangnmps10741@fpt.edu.vn', N'Nguyễn Minh Quang', 6, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'quangvvtps09851@fpt.edu.vn', N'Võ Văn Thanh Quang', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'sangntps10356@fpt.edu.vn', N'Nguyễn Tống Sang', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'sonntps10858@fpt.edu.vn', N'Nguyễn Thanh Sơn', 9, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'suotlvmps10970@fpt.edu.vn', N'Lê Vương Minh Suốt', 7, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'thachnhps10818@fpt.edu.vn', N'Nguyễn Hữu Thạch', 8, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'thangtvps10394@fpt.edu.vn', N'Trằn Văn Thắng', 9, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'trangntpps10956@fpt.edu.vn', N'Nguyễn Thị Phương Trang', 4, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'trungdvps10716@fpt.edu.vn', N'Đặng Văn Trung', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'tuanncqps10850@fpt.edu.vn', N'Nguyễn Cửu Quang Tuấn', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'tuannnps10819@fpt.edu.vn', N'Nguyễn Ngọc Tuấn', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'vinhptps09842@fpt.edu.vn', N'Phạm Thế Vinh', 10, 1, N'VN')
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Phone]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
