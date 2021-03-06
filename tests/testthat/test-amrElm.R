
context("amrElm")

test_that("amrElm does not produce NA predictions.", {

  data(heart)

  data <- heart$data
  labels <- heart$labels

  n <- nrow(data)

  split <- caTools::sample.split(labels, SplitRatio = 0.7)

  train_data <- data[split == TRUE, ]
  test_data <- data[split == FALSE, ]

  train_labels <- labels[split == TRUE]
  test_labels <- labels[split == FALSE]

  model <- amrElm(train_data, train_labels, hidden_neurons = 500)
  predicted_labels <- predict(model, test_data)

  expect_false(any(is.na(predicted_labels)))
})
