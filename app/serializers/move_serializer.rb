class MoveSerializer < ActiveModel::Serializer
  attributes :id, :player, :coordinate, :game_id
end
