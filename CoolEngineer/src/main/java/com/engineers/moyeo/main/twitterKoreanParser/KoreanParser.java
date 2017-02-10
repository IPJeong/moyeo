package com.engineers.moyeo.main.twitterKoreanParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.engineers.moyeo.main.dto.WordDTO;
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
	public synchronized static List<WordDTO> getWordsMap(String text) {
		
		// WordModel을 리턴해 주는 객체
		List<WordDTO> wordList = new ArrayList<>();
		// 단어와 카운트를 가지고 있는 맵
		Map<String, Integer> wordMap = new HashMap<>();
		// 단어와 품사를 가지고 있는 맵
		Map<String, String> wordTypeMap = new HashMap<>();
		
		// String text to Seq<KoreanTokenizer.KoreanToken>
		Seq<KoreanTokenizer.KoreanToken> tokens = KoreanTextParser.getTokens(text);
		// Seq<KoreanTokenizer.KoreanToken> to Seq<KoreanToken> koreanTokens
		Seq<KoreanToken> koreanTokens = KoreanTextParser.getStemmed(tokens);
		// Seq<KoreanToken> koreanTokens to List<KoreanTokenJava> koreanTokenJava
		List<KoreanTokenJava> koreanTokenJava = KoreanTextParser.getTokensToJavaKoreanTokenList(koreanTokens);
		
		for(KoreanTokenJava tokenJava : koreanTokenJava) {
			
			String pos = tokenJava.getPos().toString();
			if(pos.equals("Noun") || pos.equals("ProperNoun") || pos.equals("Hashtag") || pos.equals("Verb")) {
				System.out.println("분석 후 단어 : " + tokenJava.toString());
				String word = tokenJava.getText();
				if(wordMap.get(word)==null) {
					wordMap.put(word, 1);
					wordTypeMap.put(word, pos);
				} else {
					wordMap.put(word, wordMap.get(word)+1);
				}
			}
		}
		
		for(Map.Entry<String, Integer> map : wordMap.entrySet()) {
			WordDTO dto = new WordDTO();
			String word = map.getKey();
			int count = map.getValue();
			String part = wordTypeMap.get(word);
			dto.setWord(word);
			dto.setCount(count);
			dto.setPart_of_speech(part);
			wordList.add(dto);
		}
		
		return wordList;
	}
	
}
