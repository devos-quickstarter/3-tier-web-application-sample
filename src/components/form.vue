<template>
  <div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 container justify-content-center card mt-5">
      <h1 class="text-center"> Create New User</h1>
      <div class="card-body">
        <form>
          <div class="form-group">
            <label> Name </label>
            <input
                v-model="name"
                class="form-control"
                placeholder="Enter Name"
            />

            <label> E-mail </label>
            <input
                v-model="email"
                class="form-control"
                placeholder="Enter E-mail"
            />
          </div>

          <div class="footer">
            <button @click.self.prevent="submit" class="btn btn-primary mt-3">
              Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'UserForm',
  data() {
    return {
      name: '',
      email: '',
    };
  },
  methods: {
    submit() {
      const payload = {
        name: this.name,
        email: this.email
      }
      axios.create({
        url: process.env.VUE_APP_GATEWAY_URL
      }).post('/api/users', payload)
      .then((res) => {
        if (res.status === 200) {
          this.$router.push('/list')
        }
      })
      .catch(err => console.log(err))
    }
  }
}
</script>
