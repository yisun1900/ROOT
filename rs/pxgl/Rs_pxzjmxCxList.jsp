<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (rs_pxzjmx.pxjhbh='"+pxjhbh+"')";
	}
	ls_sql="SELECT rs_pxzjmx.pxjhbh pxjhbh,pxjhmc,pxmxbh,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxcd,rs_pxzjmx.pxrs pxrs,rs_pxzjmx.pxfy pxfy,gcrs,zcrs,jcrs,pxjs,DECODE(pxjg,'0','δ���','1','���','2','�������') pxjg,pxkssj,pxjssj,pxkc,kcnr,rs_pxzjmx.lrr lrr,rs_pxzjmx.lrsj lrsj,rs_pxzjmx.bz bz ";
	ls_sql+=" FROM rs_pxzjmx,rs_pxjh,rs_pxskxsbm,rs_pxkclxbm  ";
    ls_sql+=" where rs_pxzjmx.pxjhbh=rs_pxjh.pxjhbh and rs_pxskxsbm.skxs=rs_pxzjmx.skxs and rs_pxkclxbm.kclx=rs_pxzjmx.kclx";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_pxzjmxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pxmxbh","pxjhbh","skxs","kclx","pxkc","kcnr","pxcd","pxrs","pxfy","gcrs","zcrs","jcrs","pxjs","pxjg","pxkssj","pxjssj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pxmxbh"};
	pageObj.setKey(keyName);
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
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">��ѵ�ƻ����</td>
	<td  width="6%">��ѵ�ƻ�����</td>
	<td  width="5%">��ѵ��ϸ���</td>
	<td  width="4%">�ڿ���ʽ</td>
	<td  width="4%">�γ�����</td>
	<td  width="6%">��ѵ����</td>
	<td  width="3%">��ѵ����</td>
	<td  width="3%">��ѵ����</td>
	<td  width="3%">�߲�����</td>
	<td  width="3%">�в�����</td>
	<td  width="3%">��������</td>
	<td  width="3%">��ѵ��ʦ</td>
	<td  width="3%">��ϸ���</td>
	<td  width="4%">��ѵ��ʼʱ��</td>
	<td  width="4%">��ѵ����ʱ��</td>
	<td  width="11%">��ѵ�γ�</td>
	<td  width="11%">�γ�����</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="13%">��ע</td>
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