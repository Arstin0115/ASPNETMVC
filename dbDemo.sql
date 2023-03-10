USE [dbDemo]
GO
/****** Object:  Table [dbo].[tCustomer]    Script Date: 2023/1/20 下午 08:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCustomer](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](50) NULL,
	[fPhone] [nvarchar](50) NULL,
	[fEmail] [nvarchar](50) NULL,
	[fAddress] [nvarchar](50) NULL,
	[fPassword] [nvarchar](50) NULL,
	[fImages] [nvarchar](50) NULL,
 CONSTRAINT [PK_tCustomer] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 2023/1/20 下午 08:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[fId] [int] IDENTITY(1,1) NOT NULL,
	[fName] [nvarchar](50) NULL,
	[fQty] [int] NULL,
	[fCost] [money] NULL,
	[fPrice] [money] NULL,
	[fImagePath] [nvarchar](50) NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[fId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShoppingCrat]    Script Date: 2023/1/20 下午 08:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShoppingCrat](
	[fId] [int] NULL,
	[fDate] [nvarchar](50) NULL,
	[fProductId] [int] NULL,
	[fCount] [int] NULL,
	[fPrice] [money] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tCustomer] ON 

INSERT [dbo].[tCustomer] ([fId], [fName], [fPhone], [fEmail], [fAddress], [fPassword], [fImages]) VALUES (1, N'Marco', N'0964541321', N'marco@gmail.com', N'Taipei', N'123', N'2.jpg')
INSERT [dbo].[tCustomer] ([fId], [fName], [fPhone], [fEmail], [fAddress], [fPassword], [fImages]) VALUES (2, N'Selina', N'0916573663', N'selina@gmail.com', N'Tainan', N'123', N'3.jpg')
INSERT [dbo].[tCustomer] ([fId], [fName], [fPhone], [fEmail], [fAddress], [fPassword], [fImages]) VALUES (9, N'JasonLee', N'0988888888', N'ssss@gmail.com', N'PingTung', N'1234321', NULL)
SET IDENTITY_INSERT [dbo].[tCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[tProduct] ON 

INSERT [dbo].[tProduct] ([fId], [fName], [fQty], [fCost], [fPrice], [fImagePath]) VALUES (1, N'台南五天四夜之旅', 300, 4000.0000, 15000.0000, NULL)
SET IDENTITY_INSERT [dbo].[tProduct] OFF
GO
