﻿/****** Object:  Table [dbo].[Group]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Group](
	[Id] [uniqueidentifier] NOT NULL,
	[Identifier] [char](24) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[IsPrivate] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [IX_Group_Identifier] ON [dbo].[Group]
(
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_Group_Name] ON [dbo].[Group]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsPrivate]  DEFAULT ((1)) FOR [IsPrivate]
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_User_CreatedBy]
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_User_LastUpdatedBy] FOREIGN KEY([LastUpatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_User_LastUpdatedBy]