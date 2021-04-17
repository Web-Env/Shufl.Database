/****** Object:  Table [dbo].[User]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[DisplayName] [varchar](150) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](150) NOT NULL,
	[PictureUrl] [varchar](150) NOT NULL,
	[Password] [char](60) NOT NULL,
	[UserSecret] [char](344) NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[SpotifyRefreshToken] [char](344) NULL,
	[SpotifyUsername] [varchar](100) NULL,
	[SpotifyMarket] [char](2) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[LastUpdatedOn] [datetime] NULL,
	[LastUpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [IX_User_Email_Password] ON [dbo].[User]
(
	[Email] ASC,
	[Password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_PictureUrl]  DEFAULT ('https://shufl.webenv.io/assets/img/blank-user.png') FOR [PictureUrl]
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]