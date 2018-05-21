import gensim
import logging
import os
logging.basicConfig(format = '%(asctime)s : %(levelname)s : %(message)s', level = logging.INFO)
sentences1 = gensim.models.word2vec.Text8Corpus('.\data\GPCRtrain.txt')
model1 = gensim.models.word2vec.Word2Vec(sentences1, size = 100, window = 5)
model1.train(sentences1) 
model1.save('.\data\GPCR.model')
model1.save_word2vec_format(".\data\GPCR.bin", binary=True)
gp=open('.\data\GPCRfeature.txt','r')#要求的向量的目标文件
gpvec=open('.\data\GPCRvector.txt','w')#保存求得向量
gpt=open('.\data\GPCR.txt','w')#如果向量存在在此模型中，保存存在向量的单词的文件
for each_line in gp:#先读去每一行
    for each_word in each_line.split():#读取每一个单词
        if each_word in model1:
            w = model1[each_word]#在bin模型中寻找每一个词语的向量
            gpt.write(each_word+' ')
            gpvec.write(str(w)+'\t\n')
    gpt.write('\t\n')
gp.close()
gpvec.close()
gpt.close()

sentences2 = gensim.models.word2vec.Text8Corpus('.\data\GOtrain.txt')
model2 = gensim.models.word2vec.Word2Vec(sentences2, size = 100, window = 5)
model2.train(sentences2) 
model2.save('.\data\GO.model')
model2.save_word2vec_format(".\data\GO.bin", binary=True)
go=open('.\data\GOfeature.txt','r')#要求的向量的目标文件
govec=open('.\data\GOvector.txt','w')#保存求得向量
got=open('.\data\GO.txt','w')#如果向量存在在此模型中，保存存在向量的单词的文件
for each_line in go:#先读去每一行
    for each_word in each_line.split():#读取每一个单词
        if each_word in model2:
            w = model2[each_word]#在bin模型中寻找每一个词语的向量
            got.write(each_word+' ')
            govec.write(str(w)+'\t\n')
    got.write('\t\n')
go.close()
govec.close()
got.close()
