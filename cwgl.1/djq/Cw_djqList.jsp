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
	String cw_djq_fgsbh=null;
	String cw_djq_djqmc=null;
	String cw_djq_djqcdbl=null;
	String cw_djq_bz=null;
	cw_djq_fgsbh=request.getParameter("cw_djq_fgsbh");
	if (cw_djq_fgsbh!=null)
	{
		cw_djq_fgsbh=cf.GB2Uni(cw_djq_fgsbh);
		if (!(cw_djq_fgsbh.equals("")))	wheresql+=" and  (cw_djq.fgsbh='"+cw_djq_fgsbh+"')";
	}
	cw_djq_djqmc=request.getParameter("cw_djq_djqmc");
	if (cw_djq_djqmc!=null)
	{
		cw_djq_djqmc=cf.GB2Uni(cw_djq_djqmc);
		if (!(cw_djq_djqmc.equals("")))	wheresql+=" and  (cw_djq.djqmc='"+cw_djq_djqmc+"')";
	}
	cw_djq_djqcdbl=request.getParameter("cw_djq_djqcdbl");
	if (cw_djq_djqcdbl!=null)
	{
		cw_djq_djqcdbl=cw_djq_djqcdbl.trim();
		if (!(cw_djq_djqcdbl.equals("")))	wheresql+=" and  (cw_djq.djqcdbl="+cw_djq_djqcdbl+") ";
	}
	cw_djq_bz=request.getParameter("cw_djq_bz");
	if (cw_djq_bz!=null)
	{
		cw_djq_bz=cf.GB2Uni(cw_djq_bz);
		if (!(cw_djq_bz.equals("")))	wheresql+=" and  (cw_djq.bz='"+cw_djq_bz+"')";
	}
	ls_sql="SELECT cw_djq.fgsbh,sq_dwxx.dwmc,cw_djq.djqmc,cw_djq.djqcdbl,cw_djq.bz  ";
	ls_sql+=" FROM sq_dwxx,cw_djq  ";
    ls_sql+=" where cw_djq.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_djq.fgsbh,cw_djq.djqmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_djqList.jsp","","","EditCw_djq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"fgsbh","sq_dwxx_dwmc","djqmc","cw_djq_djqcdbl","cw_djq_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"fgsbh","djqmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_djqList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_djq where "+chooseitem;
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="12%">�ֹ�˾</td>
	<td  width="17%">�ֹ�˾</td>
	<td  width="30%">����ȯ����</td>
	<td  width="10%">����ȯ���ҳе�����</td>
	<td  width="67%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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