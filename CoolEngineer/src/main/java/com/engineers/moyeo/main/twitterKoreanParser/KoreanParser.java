package com.engineers.moyeo.main.twitterKoreanParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.twitter.penguin.korean.KoreanTokenJava;
import com.twitter.penguin.korean.tokenizer.KoreanTokenizer;
import com.twitter.penguin.korean.tokenizer.KoreanTokenizer.KoreanToken;

import scala.collection.Seq;

/**
 * @설명 형태소분석을 해서 word counting 기능을 수행하는 클래스
 * @author 정일품
 * @작성일자 2017.02.05
 */
public class KoreanParser {

	
	// 텍스트를 형태소 분석해서 word map으로 리턴해주는 메서드
	public synchronized static Map<String, Integer> getWordsMap(String text) {
		
		Map<String, Integer> wordMap = new HashMap<>();
		
		// String text to Seq<KoreanTokenizer.KoreanToken>
		Seq<KoreanTokenizer.KoreanToken> tokens = KoreanTextParser.getTokens(text);
		// Seq<KoreanTokenizer.KoreanToken> to Seq<KoreanToken> koreanTokens
		Seq<KoreanToken> koreanTokens = KoreanTextParser.getStemmed(tokens);
		// Seq<KoreanToken> koreanTokens to List<KoreanTokenJava> koreanTokenJava
		List<KoreanTokenJava> koreanTokenJava = KoreanTextParser.getTokensToJavaKoreanTokenList(koreanTokens);
		
		for(KoreanTokenJava tokenJava : koreanTokenJava) {
			String pos = tokenJava.getPos().toString();
			if(pos.equals("Noun") || pos.equals("ProperNoun") || pos.equals("Hashtag")) {
				String word = tokenJava.getText();
				if(wordMap.get(word)==null) {
					wordMap.put(word, 1);
				} else {
					wordMap.put(word, wordMap.get(word)+1);
				}
			}
		}
		
		return wordMap;
	}
	
}
