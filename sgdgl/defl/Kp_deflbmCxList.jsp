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
	String deflbm=null;
	String deflmc=null;
	String dedy=null;
	String dexy=null;
	String depjz=null;

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		if (!(fgsbh.equals("")))	wheresql+=" and  (kp_deflbm.fgsbh='"+fgsbh+"')";
	}

	deflbm=request.getParameter("deflbm");
	if (deflbm!=null)
	{
		deflbm=cf.GB2Uni(deflbm);
		if (!(deflbm.equals("")))	wheresql+=" and  (kp_deflbm.deflbm='"+deflbm+"')";
	}
	deflmc=request.getParameter("deflmc");
	if (deflmc!=null)
	{
		deflmc=cf.GB2Uni(deflmc);
		if (!(deflmc.equals("")))	wheresql+=" and  (kp_deflbm.deflmc='"+deflmc+"')";
	}
	dedy=request.getParameter("dedy");
	if (dedy!=null)
	{
		dedy=dedy.trim();
		if (!(dedy.equals("")))	wheresql+=" and (kp_deflbm.dedy="+dedy+") ";
	}
	dexy=request.getParameter("dexy");
	if (dexy!=null)
	{
		dexy=dexy.trim();
		if (!(dexy.equals("")))	wheresql+=" and (kp_deflbm.dexy="+dexy+") ";
	}
	depjz=request.getParameter("depjz");
	if (depjz!=null)
	{
		depjz=depjz.trim();
		if (!(depjz.equals("")))	wheresql+=" and (kp_deflbm.depjz="+depjz+") ";
	}
	ls_sql="SELECT dwmc,deflbm,deflmc,dedy,dexy,depjz  ";
	ls_sql+=" FROM kp_deflbm,sq_dwxx  ";
    ls_sql+=" where kp_deflbm.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_deflbm.fgsbh,deflbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_deflbmCxList.jsp","SelectCxKp_deflbm.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"deflbm","deflmc","dedy","dexy","depjz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"deflbm"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
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
	<td  width="15%">�ֹ�˾</td>
	<td  width="12%">��С������</td>
	<td  width="31%">��С������</td>
	<td  width="14%">�������(>=)</td>
	<td  width="14%">�����յ�(<)</td>
	<td  width="14%">����ƽ��ֵ</td>
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