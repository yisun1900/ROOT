<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qslrsjStr=request.getParameter("qslrsj");
String qzlrsj2Str=request.getParameter("qzlrsj2");


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
		
	java.sql.Date qzlrsj2=null;
	java.sql.Date qslrsj=null;

	qslrsj=java.sql.Date.valueOf(qslrsjStr);
	qzlrsj2=java.sql.Date.valueOf(qzlrsj2Str);

	conn.setAutoCommit(false);

	ls_sql=" insert into crm_khxxbk (khbh,khxm,xb,cqbm,xqbm,louhao,fwdz,rddqbm,hxwzbm,lxfs,qtdh,sfzhm,csrq,nlqjbm,ysrbm,zybm,fj,fjfwbm,hxbm,czbm,fgflbm,zxjwbm,ysbm,yqbm,hxmjbm,fwmj,pmjj,hth,smhtbh,sjs,sjsgh,wdzgce,cdzwjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqhtzjgcf,zhhtzjgcf,zqhtjjgcf,zhhtjjgcf,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,sffk,djkh,fkrq,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,zjxxh,zjxsj,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,gckkspbz,zjxwcbz,khjsbz,khjsje,sfyyh,yhyy,zkl,sffj,fjje,gsfje,fjhgs,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,sfyrz,rzsc,qyrq,jyjdrq,kgrq,jgrq,pdclzt,jlbz,pdr,pdsj,pdsm,sgd,sgbz,mgfrz,nwgfrz,sdgfrz,yqgfrz,zjxm,mgjl,nwgjl,sdgjl,yqgjl,kgzbz,sgebfb,sge,clf,gdkk,kgzsj,kgzr,kgzsm,gcjdbm,sjkgrq,ybysxmbm,sybgcrq,zqysxmbm,szqsj,sjjgrq,zlpdbm,gcsfyq,yqts,yqsm,yqlrr,yqlrsj,hzts,sjwjrq,jhtrq,tgbz,tgkssj,gjfgsj,tgyybm,tgsm,tgjzsj,dalqbz,kbxbz,bxkssj,bxjzsj,bybxsm,sjfkzc,sfke,zjxssk,jzkfkcs,jzkscsj,jzkfkxh,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfkxh,cwjzkfksj,yjjzsj,tdyjjzsj,gdjsjd,gdjsjlh,sjsjsbz,sjstcbl,qdsyjsje,sjsjsjlh,sjswgtcbl,wgtcje,wgjsjlh,sjssjfjsbz,sjfsctcbl,sjfsctcje,sjfectcbl,sjfectcje,ywyjsbz,ywyjsjlh,ywyqdjsbl,ywyqdjsje,ywywgjsjlh,ywywgjsbl,ywywgjsje,zjjsbz,zjjsjlh,zjjsbl,zjjsje,zxhfsj,hfjlh,sfxhf,hfrq,hflxbm,hfszr,hfszsj,sjhfsj,ybjbz,ybjyxq,ybjdjsj,hdbz,cgdz,hdr,hdsgd,hdsgbz,zt,khlxbm,tsbz,tsjlh,bxbz,bxjlh,tdxh,tdsj,ybjbh,ybjss,hdsfss,kpbz,kpjlh,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sjjdsj,jdr,htshbz,htshr,htshsj,htshdf,htshyj,bjjb,ywy,xmzy,ykhlxsj,jslxfs,lxsm,jzbz,sfcjq,sffby,sfzbcl,hykh,hyklxbm,yxsjs,yxsjz,kgsjqd,wtkhbz,wtkhsm,wtkhlrr,wtkhlrsj,fgsbh,dwbh,sjsbh,lrr,lrsj,yzbm,email,czhm,kdlbz,yhdlm,yhkl,sfyfdx,fdxr,fdxsj,sfysbx,baokssj,baozzsj,dybz,dysj,wgdybz,wgdysj,glftd,xxshbz,xxshr,xxshsj,xxshyj,gqts,tcmc,jjwjbz,jjwjr,jjwjsj,bz,glfjmje,sjjmje,zjxzkl,khjl,xxlysm) ";
	ls_sql+=" select khbh,khxm,xb,cqbm,xqbm,louhao,fwdz,rddqbm,hxwzbm,lxfs,qtdh,sfzhm,csrq,nlqjbm,ysrbm,zybm,fj,fjfwbm,hxbm,czbm,fgflbm,zxjwbm,ysbm,yqbm,hxmjbm,fwmj,pmjj,hth,smhtbh,sjs,sjsgh,wdzgce,cdzwjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif,zqhtzjgcf,zhhtzjgcf,zqhtjjgcf,zhhtjjgcf,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,sffk,djkh,fkrq,zjxje,zhzjxje,zjxsuijin,zqzjxguanlif,zjxguanlif,zqwjrzjx,zhwjrzjx,wjrzjxsm,kglf,kqtk,zjxxh,zjxsj,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy,gckkspbz,zjxwcbz,khjsbz,khjsje,sfyyh,yhyy,zkl,sffj,fjje,gsfje,fjhgs,cxhdbm,cxhdbmxq,cxhdbmzh,cxhdbmsc,sfyrz,rzsc,qyrq,jyjdrq,kgrq,jgrq,pdclzt,jlbz,pdr,pdsj,pdsm,sgd,sgbz,mgfrz,nwgfrz,sdgfrz,yqgfrz,zjxm,mgjl,nwgjl,sdgjl,yqgjl,kgzbz,sgebfb,sge,clf,gdkk,kgzsj,kgzr,kgzsm,gcjdbm,sjkgrq,ybysxmbm,sybgcrq,zqysxmbm,szqsj,sjjgrq,zlpdbm,gcsfyq,yqts,yqsm,yqlrr,yqlrsj,hzts,sjwjrq,jhtrq,tgbz,tgkssj,gjfgsj,tgyybm,tgsm,tgjzsj,dalqbz,kbxbz,bxkssj,bxjzsj,bybxsm,sjfkzc,sfke,zjxssk,jzkfkcs,jzkscsj,jzkfkxh,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfkxh,cwjzkfksj,yjjzsj,tdyjjzsj,gdjsjd,gdjsjlh,sjsjsbz,sjstcbl,qdsyjsje,sjsjsjlh,sjswgtcbl,wgtcje,wgjsjlh,sjssjfjsbz,sjfsctcbl,sjfsctcje,sjfectcbl,sjfectcje,ywyjsbz,ywyjsjlh,ywyqdjsbl,ywyqdjsje,ywywgjsjlh,ywywgjsbl,ywywgjsje,zjjsbz,zjjsjlh,zjjsbl,zjjsje,zxhfsj,hfjlh,sfxhf,hfrq,hflxbm,hfszr,hfszsj,sjhfsj,ybjbz,ybjyxq,ybjdjsj,hdbz,cgdz,hdr,hdsgd,hdsgbz,zt,khlxbm,tsbz,tsjlh,bxbz,bxjlh,tdxh,tdsj,ybjbh,ybjss,hdsfss,kpbz,kpjlh,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sjjdsj,jdr,htshbz,htshr,htshsj,htshdf,htshyj,bjjb,ywy,xmzy,ykhlxsj,jslxfs,lxsm,jzbz,sfcjq,sffby,sfzbcl,hykh,hyklxbm,yxsjs,yxsjz,kgsjqd,wtkhbz,wtkhsm,wtkhlrr,wtkhlrsj,fgsbh,dwbh,sjsbh,lrr,lrsj,yzbm,email,czhm,kdlbz,yhdlm,yhkl,sfyfdx,fdxr,fdxsj,sfysbx,baokssj,baozzsj,dybz,dysj,wgdybz,wgdysj,glftd,xxshbz,xxshr,xxshsj,xxshyj,gqts,tcmc,jjwjbz,jjwjr,jjwjsj,bz,glfjmje,sjjmje,zjxzkl,khjl,xxlysm ";
	ls_sql+=" from crm_khxx ";
	ls_sql+=" where lrsj>=? and lrsj<=? ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qslrsj);
	ps.setDate(2,qzlrsj2);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from crm_khxx ";
	ls_sql+=" where lrsj>=? and lrsj<=? ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,qslrsj);
	ps.setDate(2,qzlrsj2);
	ps.executeUpdate();
	ps.close();
		
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("移除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外" );
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>