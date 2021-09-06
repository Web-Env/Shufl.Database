/****** Object:  Table [dbo].[GroupAlbum]    Committed by VersionSQL https://www.versionsql.com ******/

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[GroupAlbum](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[Identifier] [char](24) NOT NULL,
	[IsRandom] [bit] NOT NULL,
	[AlbumId] [uniqueidentifier] NOT NULL,
	[RelatedGroupAlbumId] [uniqueidentifier] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[LastUpdatedOn] [datetime] NOT NULL,
	[LastUpdatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GroupAlbum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_GroupAlbum_GroupId_AlbumId] ON [dbo].[GroupAlbum]
(
	[GroupId] ASC,
	[AlbumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [IX_GroupAlbum_GroupId_Identifier] ON [dbo].[GroupAlbum]
(
	[GroupId] ASC,
	[Identifier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [dbo].[GroupAlbum] ADD  CONSTRAINT [DF_GroupAlbum_Id]  DEFAULT (newsequentialid()) FOR [Id]
ALTER TABLE [dbo].[GroupAlbum] ADD  CONSTRAINT [DF_GroupAlbum_IsRandom]  DEFAULT ((1)) FOR [IsRandom]
ALTER TABLE [dbo].[GroupAlbum]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbum_Album] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Album] ([Id])
ALTER TABLE [dbo].[GroupAlbum] CHECK CONSTRAINT [FK_GroupAlbum_Album]
ALTER TABLE [dbo].[GroupAlbum]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbum_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
ALTER TABLE [dbo].[GroupAlbum] CHECK CONSTRAINT [FK_GroupAlbum_Group]
ALTER TABLE [dbo].[GroupAlbum]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbum_GroupAlbum] FOREIGN KEY([RelatedGroupAlbumId])
REFERENCES [dbo].[GroupAlbum] ([Id])
ALTER TABLE [dbo].[GroupAlbum] CHECK CONSTRAINT [FK_GroupAlbum_GroupAlbum]
ALTER TABLE [dbo].[GroupAlbum]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbum_User_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupAlbum] CHECK CONSTRAINT [FK_GroupAlbum_User_CreatedBy]
ALTER TABLE [dbo].[GroupAlbum]  WITH CHECK ADD  CONSTRAINT [FK_GroupAlbum_User_LastUpdatedBy] FOREIGN KEY([LastUpdatedBy])
REFERENCES [dbo].[User] ([Id])
ALTER TABLE [dbo].[GroupAlbum] CHECK CONSTRAINT [FK_GroupAlbum_User_LastUpdatedBy]