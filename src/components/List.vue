<template>
  <div class="row">
    <div class="col-lg-3">
      <button class="btn btn-primary mb-3" @click="onAddClick">Add</button>
    </div>
  </div>
  <div class="container">
    <table class="table table-striped">
      <thead>
        <th>id</th>
        <th>name</th>
        <th>email</th>
      </thead>
      <tbody>
      <tr v-for="(d, idx) in list" :key="idx">
        <td>{{ d.id }}</td>
        <td>{{ d.name }}</td>
        <td>{{ d.email }}</td>
        <td><button @click="onDeleteClick(d.id)" class="btn btn-danger btn-sm">Delete</button></td>
      </tr>
      </tbody>
    </table>
  </div>

</template>

<script>
import axios from 'axios'
export default {
  name: 'UserList',
  data() {
    return {
      list: [],
    };
  },
  created() {
    this.fetchList()
  },
  methods: {
    fetchList() {
      axios.create({
        url: process.env.VUE_APP_GATEWAY_URL
      }).get('/api/users')
      .then((res) => {
        this.list = res.data.content
      })
      .catch(err => console.log(err))
    },
    onAddClick() {
      this.$router.push('/form')
    },
    onDeleteClick(id) {
      axios.create({
        url: process.env.VUE_APP_GATEWAY_URL
      }).delete('/api/users/' + id)
      .then((res) => {
        if (res.status === 200) {
          this.fetchList()
        }
      })
      .catch(err => console.log(err))
    }
  }
}
</script>
