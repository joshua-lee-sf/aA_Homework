# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id,
    dependent: :destroy

  def n_plus_one_tracks
    my_albums = self.albums
    track_counts = {}
    my_albums.each do |album|
      track_counts[album.title] = album.tracks.length
    end

    track_counts
  end

  def better_tracks_query
    # Your code here
    albums_with_track_counts = self
      .albums
      .select('albums.* COUNT(*) AS tracks_count')
      .joins(:tracks)
      .group('albums_id')

      track_counts = {}
      albums_with_track_counts.each do |album|
        tracks_counts[album] = album.tracks_counts
      end

      track_counts
  end
end