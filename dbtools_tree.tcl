if {![namespace exists ::DBTools]} {
  namespace eval ::DBTools:: {}
}

## A hashtable containing random binary trees
## with depths from 1 to 8
array set ::DBTools::tree {8 {{328 212 155 126 111 104 100 1 0} {328 212 155 126 111 104 100 1 10} {328 212 155 126 111 104 100 102 101} {328 212 155 126 111 104 100 102 103} {328 212 155 126 111 104 108 106 105} {328 212 155 126 111 104 108 106 107} {328 212 155 126 111 104 108 11 109} {328 212 155 126 111 104 108 11 110} {328 212 155 126 111 119 115 113 112} {328 212 155 126 111 119 115 113 114} {328 212 155 126 111 119 115 117 116} {328 212 155 126 111 119 115 117 118} {328 212 155 126 111 119 122 120 12} {328 212 155 126 111 119 122 120 121} {328 212 155 126 111 119 122 124 123} {328 212 155 126 111 119 122 124 125} {328 212 155 126 140 133 13 128 127} {328 212 155 126 140 133 13 128 129} {328 212 155 126 140 133 13 131 130} {328 212 155 126 140 133 13 131 132} {328 212 155 126 140 133 137 135 134} {328 212 155 126 140 133 137 135 136} {328 212 155 126 140 133 137 139 138} {328 212 155 126 140 133 137 139 14} {328 212 155 126 140 148 144 142 141} {328 212 155 126 140 148 144 142 143} {328 212 155 126 140 148 144 146 145} {328 212 155 126 140 148 144 146 147} {328 212 155 126 140 148 151 15 149} {328 212 155 126 140 148 151 15 150} {328 212 155 126 140 148 151 153 152} {328 212 155 126 140 148 151 153 154} {328 212 155 184 17 162 159 157 156} {328 212 155 184 17 162 159 157 158} {328 212 155 184 17 162 159 160 16} {328 212 155 184 17 162 159 160 161} {328 212 155 184 17 162 166 164 163} {328 212 155 184 17 162 166 164 165} {328 212 155 184 17 162 166 168 167} {328 212 155 184 17 162 166 168 169} {328 212 155 184 17 177 173 171 170} {328 212 155 184 17 177 173 171 172} {328 212 155 184 17 177 173 175 174} {328 212 155 184 17 177 173 175 176} {328 212 155 184 17 177 180 179 178} {328 212 155 184 17 177 180 179 18} {328 212 155 184 17 177 180 182 181} {328 212 155 184 17 177 180 182 183} {328 212 155 184 199 191 188 186 185} {328 212 155 184 199 191 188 186 187} {328 212 155 184 199 191 188 19 189} {328 212 155 184 199 191 188 19 190} {328 212 155 184 199 191 195 193 192} {328 212 155 184 199 191 195 193 194} {328 212 155 184 199 191 195 197 196} {328 212 155 184 199 191 195 197 198} {328 212 155 184 199 205 201 20 2} {328 212 155 184 199 205 201 20 200} {328 212 155 184 199 205 201 203 202} {328 212 155 184 199 205 201 203 204} {328 212 155 184 199 205 209 207 206} {328 212 155 184 199 205 209 207 208} {328 212 155 184 199 205 209 210 21} {328 212 155 184 199 205 209 210 211} {328 212 270 241 227 22 216 214 213} {328 212 270 241 227 22 216 214 215} {328 212 270 241 227 22 216 218 217} {328 212 270 241 227 22 216 218 219} {328 212 270 241 227 22 223 221 220} {328 212 270 241 227 22 223 221 222} {328 212 270 241 227 22 223 225 224} {328 212 270 241 227 22 223 225 226} {328 212 270 241 227 234 230 229 228} {328 212 270 241 227 234 230 229 23} {328 212 270 241 227 234 230 232 231} {328 212 270 241 227 234 230 232 233} {328 212 270 241 227 234 238 236 235} {328 212 270 241 227 234 238 236 237} {328 212 270 241 227 234 238 24 239} {328 212 270 241 227 234 238 24 240} {328 212 270 241 256 249 245 243 242} {328 212 270 241 256 249 245 243 244} {328 212 270 241 256 249 245 247 246} {328 212 270 241 256 249 245 247 248} {328 212 270 241 256 249 252 250 25} {328 212 270 241 256 249 252 250 251} {328 212 270 241 256 249 252 254 253} {328 212 270 241 256 249 252 254 255} {328 212 270 241 256 263 26 258 257} {328 212 270 241 256 263 26 258 259} {328 212 270 241 256 263 26 261 260} {328 212 270 241 256 263 26 261 262} {328 212 270 241 256 263 267 265 264} {328 212 270 241 256 263 267 265 266} {328 212 270 241 256 263 267 269 268} {328 212 270 241 256 263 267 269 27} {328 212 270 3 285 278 274 272 271} {328 212 270 3 285 278 274 272 273} {328 212 270 3 285 278 274 276 275} {328 212 270 3 285 278 274 276 277} {328 212 270 3 285 278 281 28 279} {328 212 270 3 285 278 281 28 280} {328 212 270 3 285 278 281 283 282} {328 212 270 3 285 278 281 283 284} {328 212 270 3 285 292 289 287 286} {328 212 270 3 285 292 289 287 288} {328 212 270 3 285 292 289 290 29} {328 212 270 3 285 292 289 290 291} {328 212 270 3 285 292 296 294 293} {328 212 270 3 285 292 296 294 295} {328 212 270 3 285 292 296 298 297} {328 212 270 3 285 292 296 298 299} {328 212 270 3 313 306 302 300 30} {328 212 270 3 313 306 302 300 301} {328 212 270 3 313 306 302 304 303} {328 212 270 3 313 306 302 304 305} {328 212 270 3 313 306 31 308 307} {328 212 270 3 313 306 31 308 309} {328 212 270 3 313 306 31 311 310} {328 212 270 3 313 306 31 311 312} {328 212 270 3 313 320 317 315 314} {328 212 270 3 313 320 317 315 316} {328 212 270 3 313 320 317 319 318} {328 212 270 3 313 320 317 319 32} {328 212 270 3 313 320 324 322 321} {328 212 270 3 313 320 324 322 323} {328 212 270 3 313 320 324 326 325} {328 212 270 3 313 320 324 326 327} {328 443 386 357 342 335 331 33 329} {328 443 386 357 342 335 331 33 330} {328 443 386 357 342 335 331 333 332} {328 443 386 357 342 335 331 333 334} {328 443 386 357 342 335 339 337 336} {328 443 386 357 342 335 339 337 338} {328 443 386 357 342 335 339 340 34} {328 443 386 357 342 335 339 340 341} {328 443 386 357 342 35 346 344 343} {328 443 386 357 342 35 346 344 345} {328 443 386 357 342 35 346 348 347} {328 443 386 357 342 35 346 348 349} {328 443 386 357 342 35 353 351 350} {328 443 386 357 342 35 353 351 352} {328 443 386 357 342 35 353 355 354} {328 443 386 357 342 35 353 355 356} {328 443 386 357 371 364 360 359 358} {328 443 386 357 371 364 360 359 36} {328 443 386 357 371 364 360 362 361} {328 443 386 357 371 364 360 362 363} {328 443 386 357 371 364 368 366 365} {328 443 386 357 371 364 368 366 367} {328 443 386 357 371 364 368 37 369} {328 443 386 357 371 364 368 37 370} {328 443 386 357 371 379 375 373 372} {328 443 386 357 371 379 375 373 374} {328 443 386 357 371 379 375 377 376} {328 443 386 357 371 379 375 377 378} {328 443 386 357 371 379 382 380 38} {328 443 386 357 371 379 382 380 381} {328 443 386 357 371 379 382 384 383} {328 443 386 357 371 379 382 384 385} {328 443 386 414 40 393 39 388 387} {328 443 386 414 40 393 39 388 389} {328 443 386 414 40 393 39 391 390} {328 443 386 414 40 393 39 391 392} {328 443 386 414 40 393 397 395 394} {328 443 386 414 40 393 397 395 396} {328 443 386 414 40 393 397 399 398} {328 443 386 414 40 393 397 399 4} {328 443 386 414 40 407 403 401 400} {328 443 386 414 40 407 403 401 402} {328 443 386 414 40 407 403 405 404} {328 443 386 414 40 407 403 405 406} {328 443 386 414 40 407 410 409 408} {328 443 386 414 40 407 410 409 41} {328 443 386 414 40 407 410 412 411} {328 443 386 414 40 407 410 412 413} {328 443 386 414 429 421 418 416 415} {328 443 386 414 429 421 418 416 417} {328 443 386 414 429 421 418 42 419} {328 443 386 414 429 421 418 42 420} {328 443 386 414 429 421 425 423 422} {328 443 386 414 429 421 425 423 424} {328 443 386 414 429 421 425 427 426} {328 443 386 414 429 421 425 427 428} {328 443 386 414 429 436 432 430 43} {328 443 386 414 429 436 432 430 431} {328 443 386 414 429 436 432 434 433} {328 443 386 414 429 436 432 434 435} {328 443 386 414 429 436 44 438 437} {328 443 386 414 429 436 44 438 439} {328 443 386 414 429 436 44 441 440} {328 443 386 414 429 436 44 441 442} {328 443 500 472 458 450 447 445 444} {328 443 500 472 458 450 447 445 446} {328 443 500 472 458 450 447 449 448} {328 443 500 472 458 450 447 449 45} {328 443 500 472 458 450 454 452 451} {328 443 500 472 458 450 454 452 453} {328 443 500 472 458 450 454 456 455} {328 443 500 472 458 450 454 456 457} {328 443 500 472 458 465 461 46 459} {328 443 500 472 458 465 461 46 460} {328 443 500 472 458 465 461 463 462} {328 443 500 472 458 465 461 463 464} {328 443 500 472 458 465 469 467 466} {328 443 500 472 458 465 469 467 468} {328 443 500 472 458 465 469 470 47} {328 443 500 472 458 465 469 470 471} {328 443 500 472 487 48 476 474 473} {328 443 500 472 487 48 476 474 475} {328 443 500 472 487 48 476 478 477} {328 443 500 472 487 48 476 478 479} {328 443 500 472 487 48 483 481 480} {328 443 500 472 487 48 483 481 482} {328 443 500 472 487 48 483 485 484} {328 443 500 472 487 48 483 485 486} {328 443 500 472 487 494 490 489 488} {328 443 500 472 487 494 490 489 49} {328 443 500 472 487 494 490 492 491} {328 443 500 472 487 494 490 492 493} {328 443 500 472 487 494 498 496 495} {328 443 500 472 487 494 498 496 497} {328 443 500 472 487 494 498 5 499} {328 443 500 472 487 494 498 5 50} {328 443 500 70 56 508 504 502 501} {328 443 500 70 56 508 504 502 503} {328 443 500 70 56 508 504 506 505} {328 443 500 70 56 508 504 506 507} {328 443 500 70 56 508 52 51 509} {328 443 500 70 56 508 52 51 510} {328 443 500 70 56 508 52 54 53} {328 443 500 70 56 508 52 54 55} {328 443 500 70 56 63 6 58 57} {328 443 500 70 56 63 6 58 59} {328 443 500 70 56 63 6 61 60} {328 443 500 70 56 63 6 61 62} {328 443 500 70 56 63 67 65 64} {328 443 500 70 56 63 67 65 66} {328 443 500 70 56 63 67 69 68} {328 443 500 70 56 63 67 69 7} {328 443 500 70 85 78 74 72 71} {328 443 500 70 85 78 74 72 73} {328 443 500 70 85 78 74 76 75} {328 443 500 70 85 78 74 76 77} {328 443 500 70 85 78 81 8 79} {328 443 500 70 85 78 81 8 80} {328 443 500 70 85 78 81 83 82} {328 443 500 70 85 78 81 83 84} {328 443 500 70 85 92 89 87 86} {328 443 500 70 85 92 89 87 88} {328 443 500 70 85 92 89 90 9} {328 443 500 70 85 92 89 90 91} {328 443 500 70 85 92 96 94 93} {328 443 500 70 85 92 96 94 95} {328 443 500 70 85 92 96 98 97} {328 443 500 70 85 92 96 98 99}} 4 {{22 15 11 1 0} {22 15 11 1 10} {22 15 11 13 12} {22 15 11 13 14} {22 15 19 17 16} {22 15 19 17 18} {22 15 19 20 2} {22 15 19 20 21} {22 3 26 24 23} {22 3 26 24 25} {22 3 26 28 27} {22 3 26 28 29} {22 3 6 4 30} {22 3 6 4 5} {22 3 6 8 7} {22 3 6 8 9}} 0 0 5 {{37 22 15 11 1 0} {37 22 15 11 1 10} {37 22 15 11 13 12} {37 22 15 11 13 14} {37 22 15 19 17 16} {37 22 15 19 17 18} {37 22 15 19 20 2} {37 22 15 19 20 21} {37 22 3 26 24 23} {37 22 3 26 24 25} {37 22 3 26 28 27} {37 22 3 26 28 29} {37 22 3 33 31 30} {37 22 3 33 31 32} {37 22 3 33 35 34} {37 22 3 33 35 36} {37 51 44 40 39 38} {37 51 44 40 39 4} {37 51 44 40 42 41} {37 51 44 40 42 43} {37 51 44 48 46 45} {37 51 44 48 46 47} {37 51 44 48 5 49} {37 51 44 48 5 50} {37 51 59 55 53 52} {37 51 59 55 53 54} {37 51 59 55 57 56} {37 51 59 55 57 58} {37 51 59 62 60 6} {37 51 59 62 60 61} {37 51 59 62 8 7} {37 51 59 62 8 9}} 1 {{1 0} {1 2}} 6 {{41 126 111 104 100 1 0} {41 126 111 104 100 1 10} {41 126 111 104 100 102 101} {41 126 111 104 100 102 103} {41 126 111 104 108 106 105} {41 126 111 104 108 106 107} {41 126 111 104 108 11 109} {41 126 111 104 108 11 110} {41 126 111 119 115 113 112} {41 126 111 119 115 113 114} {41 126 111 119 115 117 116} {41 126 111 119 115 117 118} {41 126 111 119 122 120 12} {41 126 111 119 122 120 121} {41 126 111 119 122 124 123} {41 126 111 119 122 124 125} {41 126 27 2 16 14 13} {41 126 27 2 16 14 15} {41 126 27 2 16 18 17} {41 126 27 2 16 18 19} {41 126 27 2 23 21 20} {41 126 27 2 23 21 22} {41 126 27 2 23 25 24} {41 126 27 2 23 25 26} {41 126 27 34 30 29 28} {41 126 27 34 30 29 3} {41 126 27 34 30 32 31} {41 126 27 34 30 32 33} {41 126 27 34 38 36 35} {41 126 27 34 38 36 37} {41 126 27 34 38 4 39} {41 126 27 34 38 4 40} {41 70 56 49 45 43 42} {41 70 56 49 45 43 44} {41 70 56 49 45 47 46} {41 70 56 49 45 47 48} {41 70 56 49 52 50 5} {41 70 56 49 52 50 51} {41 70 56 49 52 54 53} {41 70 56 49 52 54 55} {41 70 56 63 6 58 57} {41 70 56 63 6 58 59} {41 70 56 63 6 61 60} {41 70 56 63 6 61 62} {41 70 56 63 67 65 64} {41 70 56 63 67 65 66} {41 70 56 63 67 69 68} {41 70 56 63 67 69 7} {41 70 85 78 74 72 71} {41 70 85 78 74 72 73} {41 70 85 78 74 76 75} {41 70 85 78 74 76 77} {41 70 85 78 81 8 79} {41 70 85 78 81 8 80} {41 70 85 78 81 83 82} {41 70 85 78 81 83 84} {41 70 85 92 89 87 86} {41 70 85 92 89 87 88} {41 70 85 92 89 90 9} {41 70 85 92 89 90 91} {41 70 85 92 96 94 93} {41 70 85 92 96 94 95} {41 70 85 92 96 98 97} {41 70 85 92 96 98 99}} 2 {{3 1 0} {3 1 2} {3 5 4} {3 5 6}} 7 {{212 155 126 111 104 100 1 0} {212 155 126 111 104 100 1 10} {212 155 126 111 104 100 102 101} {212 155 126 111 104 100 102 103} {212 155 126 111 104 108 106 105} {212 155 126 111 104 108 106 107} {212 155 126 111 104 108 11 109} {212 155 126 111 104 108 11 110} {212 155 126 111 119 115 113 112} {212 155 126 111 119 115 113 114} {212 155 126 111 119 115 117 116} {212 155 126 111 119 115 117 118} {212 155 126 111 119 122 120 12} {212 155 126 111 119 122 120 121} {212 155 126 111 119 122 124 123} {212 155 126 111 119 122 124 125} {212 155 126 140 133 13 128 127} {212 155 126 140 133 13 128 129} {212 155 126 140 133 13 131 130} {212 155 126 140 133 13 131 132} {212 155 126 140 133 137 135 134} {212 155 126 140 133 137 135 136} {212 155 126 140 133 137 139 138} {212 155 126 140 133 137 139 14} {212 155 126 140 148 144 142 141} {212 155 126 140 148 144 142 143} {212 155 126 140 148 144 146 145} {212 155 126 140 148 144 146 147} {212 155 126 140 148 151 15 149} {212 155 126 140 148 151 15 150} {212 155 126 140 148 151 153 152} {212 155 126 140 148 151 153 154} {212 155 184 17 162 159 157 156} {212 155 184 17 162 159 157 158} {212 155 184 17 162 159 160 16} {212 155 184 17 162 159 160 161} {212 155 184 17 162 166 164 163} {212 155 184 17 162 166 164 165} {212 155 184 17 162 166 168 167} {212 155 184 17 162 166 168 169} {212 155 184 17 177 173 171 170} {212 155 184 17 177 173 171 172} {212 155 184 17 177 173 175 174} {212 155 184 17 177 173 175 176} {212 155 184 17 177 180 179 178} {212 155 184 17 177 180 179 18} {212 155 184 17 177 180 182 181} {212 155 184 17 177 180 182 183} {212 155 184 199 191 188 186 185} {212 155 184 199 191 188 186 187} {212 155 184 199 191 188 19 189} {212 155 184 199 191 188 19 190} {212 155 184 199 191 195 193 192} {212 155 184 199 191 195 193 194} {212 155 184 199 191 195 197 196} {212 155 184 199 191 195 197 198} {212 155 184 199 205 201 20 2} {212 155 184 199 205 201 20 200} {212 155 184 199 205 201 203 202} {212 155 184 199 205 201 203 204} {212 155 184 199 205 209 207 206} {212 155 184 199 205 209 207 208} {212 155 184 199 205 209 210 21} {212 155 184 199 205 209 210 211} {212 41 241 227 22 216 214 213} {212 41 241 227 22 216 214 215} {212 41 241 227 22 216 218 217} {212 41 241 227 22 216 218 219} {212 41 241 227 22 223 221 220} {212 41 241 227 22 223 221 222} {212 41 241 227 22 223 225 224} {212 41 241 227 22 223 225 226} {212 41 241 227 234 230 229 228} {212 41 241 227 234 230 229 23} {212 41 241 227 234 230 232 231} {212 41 241 227 234 230 232 233} {212 41 241 227 234 238 236 235} {212 41 241 227 234 238 236 237} {212 41 241 227 234 238 24 239} {212 41 241 227 234 238 24 240} {212 41 241 27 249 245 243 242} {212 41 241 27 249 245 243 244} {212 41 241 27 249 245 247 246} {212 41 241 27 249 245 247 248} {212 41 241 27 249 252 250 25} {212 41 241 27 249 252 250 251} {212 41 241 27 249 252 254 253} {212 41 241 27 249 252 254 26} {212 41 241 27 34 30 29 28} {212 41 241 27 34 30 29 3} {212 41 241 27 34 30 32 31} {212 41 241 27 34 30 32 33} {212 41 241 27 34 38 36 35} {212 41 241 27 34 38 36 37} {212 41 241 27 34 38 4 39} {212 41 241 27 34 38 4 40} {212 41 70 56 49 45 43 42} {212 41 70 56 49 45 43 44} {212 41 70 56 49 45 47 46} {212 41 70 56 49 45 47 48} {212 41 70 56 49 52 50 5} {212 41 70 56 49 52 50 51} {212 41 70 56 49 52 54 53} {212 41 70 56 49 52 54 55} {212 41 70 56 63 6 58 57} {212 41 70 56 63 6 58 59} {212 41 70 56 63 6 61 60} {212 41 70 56 63 6 61 62} {212 41 70 56 63 67 65 64} {212 41 70 56 63 67 65 66} {212 41 70 56 63 67 69 68} {212 41 70 56 63 67 69 7} {212 41 70 85 78 74 72 71} {212 41 70 85 78 74 72 73} {212 41 70 85 78 74 76 75} {212 41 70 85 78 74 76 77} {212 41 70 85 78 81 8 79} {212 41 70 85 78 81 8 80} {212 41 70 85 78 81 83 82} {212 41 70 85 78 81 83 84} {212 41 70 85 92 89 87 86} {212 41 70 85 92 89 87 88} {212 41 70 85 92 89 90 9} {212 41 70 85 92 89 90 91} {212 41 70 85 92 96 94 93} {212 41 70 85 92 96 94 95} {212 41 70 85 92 96 98 97} {212 41 70 85 92 96 98 99}} 3 {{2 11 1 0} {2 11 1 10} {2 11 13 12} {2 11 13 14} {2 6 4 3} {2 6 4 5} {2 6 8 7} {2 6 8 9}}}

proc ::DBTools::getNodes {gen depth {key "none"}} {

  variable tree 

  ## Return the full paths to all 
  ## nodes at a particular depth.
  ## Match at that depth if specified 
  
  if {$key != "none"} {
    set retval [lsearch -ascii -inline -all -index\
       $depth $tree($gen) $key]
  } else {
    set retval [lsort \
      -unique -integer -index $depth $tree($gen)]
    set retval [lsort \
      -increasing -integer -index $gen-1 $retval]
  }
  
    return $retval
}
