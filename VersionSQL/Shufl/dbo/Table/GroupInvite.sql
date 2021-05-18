/****** Object:  Table [dbo].[GroupInvite]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GroupInvite](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[Identifier] [char](24) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GroupInvite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [IX_GroupInvite_GroupId_Identifier] ON [dbo].[GroupInvite]
(
	[GroupId] ASC,
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[GroupInvite] ADD  CONSTRAINT [DF_GroupInvite_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[GroupInvite]  WITH CHECK ADD  CONSTRAINT [FK_GroupInvite_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ALTER TABLE [dbo].[GroupInvite] CHECK CONSTRAINT [FK_GroupInvite_Group]
ALTER TABLE [dbo].[GroupInvite]  WITH CHECK ADD  CONSTRAINT [FK_GroupInvite_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupInvite] CHECK CONSTRAINT [FK_GroupInvite_User_CreatedBy]
ALTER TABLE [dbo].[GroupInvite]  WITH CHECK ADD  CONSTRAINT [FK_GroupInvite_User_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupInvite] CHECK CONSTRAINT [FK_GroupInvite_User_LastUpdatedBy]