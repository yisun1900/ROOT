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
	String jxc_kcjz_jzph=null;
	String jxc_kcjz_ckbh=null;
	String jxc_kcjz_zcpzsl=null;
	String jxc_kcjz_zcpzjg=null;
	String jxc_kcjz_ccpzsl=null;
	String jxc_kcjz_ccpzje=null;
	String jxc_kcjz_bfpzsl=null;
	String jxc_kcjz_bfpzje=null;
	String jxc_kcjz_jzrq=null;
	jxc_kcjz_jzph=request.getParameter("jxc_kcjz_jzph");
	if (jxc_kcjz_jzph!=null)
	{
		jxc_kcjz_jzph=cf.GB2Uni(jxc_kcjz_jzph);
		if (!(jxc_kcjz_jzph.equals("")))	wheresql+=" and  (jxc_kcjz.jzph='"+jxc_kcjz_jzph+"')";
	}
	jxc_kcjz_ckbh=request.getParameter("jxc_kcjz_ckbh");
	if (jxc_kcjz_ckbh!=null)
	{
		jxc_kcjz_ckbh=cf.GB2Uni(jxc_kcjz_ckbh);
		if (!(jxc_kcjz_ckbh.equals("")))	wheresql+=" and  (jxc_kcjz.ckbh='"+jxc_kcjz_ckbh+"')";
	}
	jxc_kcjz_zcpzsl=request.getParameter("jxc_kcjz_zcpzsl");
	if (jxc_kcjz_zcpzsl!=null)
	{
		jxc_kcjz_zcpzsl=jxc_kcjz_zcpzsl.trim();
		if (!(jxc_kcjz_zcpzsl.equals("")))	wheresql+=" and (jxc_kcjz.zcpzsl="+jxc_kcjz_zcpzsl+") ";
	}
	jxc_kcjz_zcpzjg=request.getParameter("jxc_kcjz_zcpzjg");
	if (jxc_kcjz_zcpzjg!=null)
	{
		jxc_kcjz_zcpzjg=jxc_kcjz_zcpzjg.trim();
		if (!(jxc_kcjz_zcpzjg.equals("")))	wheresql+=" and  (jxc_kcjz.zcpzjg="+jxc_kcjz_zcpzjg+") ";
	}
	jxc_kcjz_ccpzsl=request.getParameter("jxc_kcjz_ccpzsl");
	if (jxc_kcjz_ccpzsl!=null)
	{
		jxc_kcjz_ccpzsl=jxc_kcjz_ccpzsl.trim();
		if (!(jxc_kcjz_ccpzsl.equals("")))	wheresql+=" and (jxc_kcjz.ccpzsl="+jxc_kcjz_ccpzsl+") ";
	}
	jxc_kcjz_ccpzje=request.getParameter("jxc_kcjz_ccpzje");
	if (jxc_kcjz_ccpzje!=null)
	{
		jxc_kcjz_ccpzje=jxc_kcjz_ccpzje.trim();
		if (!(jxc_kcjz_ccpzje.equals("")))	wheresql+=" and  (jxc_kcjz.ccpzje="+jxc_kcjz_ccpzje+") ";
	}
	jxc_kcjz_bfpzsl=request.getParameter("jxc_kcjz_bfpzsl");
	if (jxc_kcjz_bfpzsl!=null)
	{
		jxc_kcjz_bfpzsl=jxc_kcjz_bfpzsl.trim();
		if (!(jxc_kcjz_bfpzsl.equals("")))	wheresql+=" and (jxc_kcjz.bfpzsl="+jxc_kcjz_bfpzsl+") ";
	}
	jxc_kcjz_bfpzje=request.getParameter("jxc_kcjz_bfpzje");
	if (jxc_kcjz_bfpzje!=null)
	{
		jxc_kcjz_bfpzje=jxc_kcjz_bfpzje.trim();
		if (!(jxc_kcjz_bfpzje.equals("")))	wheresql+=" and  (jxc_kcjz.bfpzje="+jxc_kcjz_bfpzje+") ";
	}
	jxc_kcjz_jzrq=request.getParameter("jxc_kcjz_jzrq");
	if (jxc_kcjz_jzrq!=null)
	{
		jxc_kcjz_jzrq=jxc_kcjz_jzrq.trim();
		if (!(jxc_kcjz_jzrq.equals("")))	wheresql+="  and (jxc_kcjz.jzrq=TO_DATE('"+jxc_kcjz_jzrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT jxc_kcjz.jzph,ckmc,jxc_kcjz.zcpzsl,jxc_kcjz.zcpzjg,jxc_kcjz.ccpzsl,jxc_kcjz.ccpzje,jxc_kcjz.bfpzsl,jxc_kcjz.bfpzje,jxc_kcjz.jzrq  ";
	ls_sql+=" FROM jxc_kcjz,jxc_ckmc  ";
    ls_sql+=" where jxc_kcjz.ckbh=jxc_ckmc.ckbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_kcjzCxList.jsp","SelectCxJxc_kcjz.jsp","ViewJxc_kcjz.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jzph","jxc_kcjz_ckbh","jxc_kcjz_zcpzsl","jxc_kcjz_zcpzjg","jxc_kcjz_ccpzsl","jxc_kcjz_ccpzje","jxc_kcjz_bfpzsl","jxc_kcjz_bfpzje","jxc_kcjz_jzrq"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jzph"};
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">��ת����</td>
	<td  width="11%">�ֿ�����</td>
	<td  width="11%">����Ʒ������</td>
	<td  width="14%">����Ʒ�ܽ��</td>
	<td  width="9%">�д�Ʒ������</td>
	<td  width="12%">�д�Ʒ�ܽ��</td>
	<td  width="9%">����Ʒ������</td>
	<td  width="12%">����Ʒ�ܽ��</td>
	<td  width="10%">��ת����</td>
</tr>
<%
	pageObj.displayDateSum();
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