<template>
<div class="card">
  <ul class="list-group list-group-flush">
    <comment-card
      v-for="(comment, index) in comments"
      :key="comment.id"
      :comment="comment"
      :users="users[index]"
    ></comment-card>
  </ul>
</div>
</template>

<script>
import axios from 'axios';
import CommentCard from './CommentCard'

export default {
  name: 'CommentsContainer',
  props: {
    comments: {
      type: Array,
    },
    users: {
      type: Array,
    }
  },
  components: {
    CommentCard
  },
};
</script>

<style scoped>
#card-container {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  align-items: flex-start;
}
</style>
