Dropify.MessageForm = function(contentFieldSelector, submitSelector, messageHandler) {
  this.$contentField = $(contentFieldSelector);
  this.messageHandler = messageHandler;
  this.bindEventListeners(submitSelector);
};

Dropify.MessageForm.prototype = {
  bindEventListeners: function(submitSelector) {
    $(submitSelector).on("click", this.handleSubmitClick.bind(this));
  },
  handleSubmitClick: function(evt) {
    $('#new_message').slideUp();
    $('#drop_message_button').slideDown();

    evt.preventDefault();
    this.messageHandler.createMessage(this.getContentText());
    $('#new_picture').slideDown("slow")
  },
  getContentText: function() {
    return this.$contentField.val();
  }
};