<template>
    <div class="row">
           <div>
               <div class="card-body p-0" style="width:1160px;">
                   <ul class="list-unstyled msg-body" style="height:420px; overflow-y:scroll" v-chat-scroll>
                       <li class="p-2" v-for="(message, index) in messages" :key="index" >
                            <div v-if="message.sender_id == user.id" class="details mt-2" style="text-align:right;">
                                <b v-if="message.message!=''">{{ decrypt(message.message) }}</b>
                                    <div v-if="message.message==''">        
                                        <button style="background-color:gray;border:1px solid black;padding:10px;border-radius:4%;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.png') || message.file.includes('.jpg') || message.file.includes('.jpeg')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/imageicon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.mp4') || message.file.includes('.mp3')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/videoicon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.pdf')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/pdficon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.sql') || message.file.includes('.txt')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/texticon.png">    
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.zip')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/zipicon.png">    
                                                    </td>
                                                &nbsp;&nbsp;
                                                <b style="color:white;" else>{{ message.file }}</b>
                                                </tr>
                                            </table>
                                        </button>
                                    </div>
                                </br>
                                <small v-if="message.status == 0">Delivered</small>
                                <small v-else>Read</small>
                                <small>{{ message.created_at | formatDate}}</small>
                            </div>
                            <div class="details mt-2" v-else>
                                <b v-if="message.message!=''">{{ decrypt(message.message) }}</b>    
                                    <div v-if="message.message==''">        
                                        <button style="background-color:gray;border:1px solid black;padding:10px;border-radius:4%;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.png') || message.file.includes('.jpg') || message.file.includes('.jpeg')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/imageicon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.mp4') || message.file.includes('.mp3')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/videoicon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.pdf')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/pdficon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.sql') || message.file.includes('.txt')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/texticon.png">
                                                        <img v-on:click="preview($event)" v-if="message.file.includes('.zip')" v-bind:id="message.file" style="border:1px solid black;width:34px;height:38px;" src="http://127.0.0.1:8000/assets/uploads/zipicon.png">    
                                                    </td>
                                                &nbsp;&nbsp;
                                                <b style="color:white;" else>{{ message.file }}</b>
                                                </tr>
                                            </table>
                                        </button>
                                    </div>
                                </br>
                                <small>{{ message.created_at | formatDate}}</small>
                            </div>
                       </li>
                   </ul>
               </div>
               <span class="text-muted ml-2" v-if="activeUser && otherUser" >{{ activeUser.name }} is typing...</span>
                <div style="display: flex; border:1px solid gray;width:1150px;" >
                <input
                    @keydown="sendTypingEvent"
                    v-model="newMessage"
                    type="text"
                    name="message"
                    placeholder="Enter your message..."
                    style="width:1110px;height:38px;border: none;"
                    class="form-control">
                    
                    <button  @click="onPickFile"><i class="fa fa-file ml-1 "></i></button>
                    <input
                        type="file"
                        name="file"
                        id="file"
                        style="display: none"
                        ref="fileInput"
                        @change="onFilePicked"/>
                    
                    <button v-on:click="sendMessage" style="width:35px;height:40px;text-align:center;"><i class="fa fa-telegram"></i></button>
                </div>
           </div>
        </div>
</template>

<script>
    export default {

        props:['user','group'],
        
        data() {
            return {
            }
        },
        created() {
            
        },
        methods: {
        }
    }
</script>
