<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String yjygbh=request.getParameter("yjygbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String yjbh=null;
	String yjzt=null;
	String sjr=null;
	String fjr=null;
	String fssj=null;
	String yjlx=null;
	String sfyd=null;
	String fjmc=null;
	String fjym=null;
	String yjnr=null;
	yjbh=request.getParameter("yjbh");
	if (yjbh!=null)
	{
		yjbh=cf.GB2Uni(yjbh);
		if (!(yjbh.equals("")))	wheresql+=" and  (yjbh='"+yjbh+"')";
	}
	yjzt=request.getParameter("yjzt");
	if (yjzt!=null)
	{
		yjzt=cf.GB2Uni(yjzt);
		if (!(yjzt.equals("")))	wheresql+=" and  (yjzt like '%"+yjzt+"%')";
	}
	sjr=request.getParameter("sjr");
	if (sjr!=null)
	{
		sjr=sjr.trim();
		if (!(sjr.equals("")))	wheresql+=" and (sjr="+sjr+") ";
	}
	fjr=request.getParameter("fjr");
	if (fjr!=null)
	{
		fjr=fjr.trim();
		if (!(fjr.equals("")))	wheresql+=" and (fjr="+fjr+") ";
	}
	fssj=request.getParameter("fssj");
	if (fssj!=null)
	{
		fssj=fssj.trim();
		if (!(fssj.equals("")))	wheresql+="  and (fssj>=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	fssj=request.getParameter("fssj2");
	if (fssj!=null)
	{
		fssj=fssj.trim();
		if (!(fssj.equals("")))	wheresql+="  and (fssj<=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	yjlx=request.getParameter("yjlx");
	if (yjlx!=null)
	{
		yjlx=cf.GB2Uni(yjlx);
		if (!(yjlx.equals("")))	wheresql+=" and  (yjlx='"+yjlx+"')";
	}
	sfyd=request.getParameter("sfyd");
	if (sfyd!=null)
	{
		sfyd=cf.GB2Uni(sfyd);
		if (!(sfyd.equals("")))	wheresql+=" and  (sfyd='"+sfyd+"')";
	}
	fjmc=request.getParameter("fjmc");
	if (fjmc!=null)
	{
		fjmc=cf.GB2Uni(fjmc);
		if (!(fjmc.equals("")))	wheresql+=" and  (fjmc='"+fjmc+"')";
	}
	fjym=request.getParameter("fjym");
	if (fjym!=null)
	{
		fjym=cf.GB2Uni(fjym);
		if (!(fjym.equals("")))	wheresql+=" and  (fjym='"+fjym+"')";
	}
	yjnr=request.getParameter("yjnr");
	if (yjnr!=null)
	{
		yjnr=cf.GB2Uni(yjnr);
		if (!(yjnr.equals("")))	wheresql+=" and  (yjnr like '%"+yjnr+"%')";
	}
	ls_sql="SELECT '<a href=\"Delete_sjx.jsp?whereyjbh='||yjbh||'&yjygbh="+yjygbh+"\">ɾ��</a>' sc,yjbh,DECODE(yjlx,'J','<font color=red>����</font>','P','��ͨ') yjlx,DECODE(sfyd,'Y','�Ѷ�','N','δ��') sfyd,'<a href=\"ViewNbyj_sjx.jsp?yjbh='||yjbh||'\">'||yjzt||'</a>' yjzt,a.yhmc sjr,b.yhmc fjr,to_char(fssj,'YYYY-MM-DD'),fjym  ";
	ls_sql+=" FROM nbyj_sjx,sq_yhxx a,sq_yhxx b  ";
    ls_sql+=" where a.ygbh=nbyj_sjx.sjr and b.ygbh=nbyj_sjx.fjr ";
	ls_sql+=" and sjr="+yjygbh+" and fssj<=sysdate ";
    ls_sql+=wheresql;
	ls_sql+=" order by fssj desc,sfyd,yjlx desc  ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Nbyj_sjxList.jsp","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yjbh","yjzt","sjr","fjr","fssj","yjlx","sfyd","fjmc","fjym","yjnr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"yjbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Nbyj_sjxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0������;1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ;PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] yjbh = request.getParameterValues("yjbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(yjbh,"yjbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from nbyj_sjx where "+chooseitem+" and sfyd='Y'";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B><font color=red>����������ʼ�ɾ��������˵����û���Ķ���</font>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
<td  width="3%">&nbsp;</td>
	<td  width="3%">ɾ��</td>
	<td  width="5%">�ʼ����</td>
	<td  width="3%">�ʼ�����</td>
	<td  width="3%">�Ƿ��Ѷ�</td>
	<td  width="20%">�ʼ�����</td>
	<td  width="4%">�ռ���</td>
	<td  width="4%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="8%">����ԭ��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>
