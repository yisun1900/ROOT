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
	String fkfabm=null;
	String cw_fkfamx_fkcs=null;
	String cw_fkfamx_lx=null;
	String sfbhglf=null;
	String sfbhsj=null;
	fkfabm=request.getParameter("fkfabm");
	if (fkfabm!=null)
	{
		fkfabm=cf.GB2Uni(fkfabm);
		if (!(fkfabm.equals("")))	wheresql+=" and  (cw_fkfamx.fkfabm='"+fkfabm+"')";
	}
	cw_fkfamx_fkcs=request.getParameter("cw_fkfamx_fkcs");
	if (cw_fkfamx_fkcs!=null)
	{
		cw_fkfamx_fkcs=cw_fkfamx_fkcs.trim();
		if (!(cw_fkfamx_fkcs.equals("")))	wheresql+=" and (cw_fkfamx.fkcs="+cw_fkfamx_fkcs+") ";
	}
	cw_fkfamx_lx=request.getParameter("cw_fkfamx_lx");
	if (cw_fkfamx_lx!=null)
	{
		cw_fkfamx_lx=cf.GB2Uni(cw_fkfamx_lx);
		if (!(cw_fkfamx_lx.equals("")))	wheresql+=" and  (cw_fkfamx.lx='"+cw_fkfamx_lx+"')";
	}
	sfbhglf=request.getParameter("sfbhglf");
	if (sfbhglf!=null)
	{
		sfbhglf=cf.GB2Uni(sfbhglf);
		if (!(sfbhglf.equals("")))	wheresql+=" and  (cw_fkfamx.sfbhglf='"+sfbhglf+"')";
	}
	sfbhsj=request.getParameter("sfbhsj");
	if (sfbhsj!=null)
	{
		sfbhsj=cf.GB2Uni(sfbhsj);
		if (!(sfbhsj.equals("")))	wheresql+=" and  (cw_fkfamx.sfbhsj='"+sfbhsj+"')";
	}
	ls_sql="SELECT fkfamc,cw_fkfamx.fkfabm,cw_fkfamx.fkcs,cw_fkcs.fkcsmc, DECODE(cw_fkfamx.lx,'1','����ǰ�տ�(����������)','2','����ǰ�տ��������һ����ȡ��','3','����ǰ�տ��������ִ���ȡ��','6','���ۺ��տ�(����������)','7','���ۺ��տ��������һ����ȡ��','8','���ۺ��տ��������ִ���ȡ��','A','��ǰ������','B','�ۺ�������') lx,DECODE(cw_fkfamx.sfsjfsesk,'N','��','Y','�ܶ�') sfsjfsesk,DECODE(cw_fkfamx.sfbhgcf,'N','������','Y','����') sfbhgcf,DECODE(cw_fkfamx.sfbhjrqtf,'N','������','Y','����') sfbhjrqtf,DECODE(cw_fkfamx.sfbhbjrqtf,'N','������','Y','����') sfbhbjrqtf,DECODE(cw_fkfamx.sfbhsjf,'N','������','Y','����') sfbhsjf,DECODE(cw_fkfamx.sfbhglf,'N','������','Y','����') sfbhglf,DECODE(cw_fkfamx.sfbhsj,'N','������','Y','����') sfbhsj,DECODE(cw_fkfamx.sfbhzcf,'N','������','Y','����') sfbhzcf,cw_fkfamx.bqfkbl,cw_fkfamx.yfkbl  ";
	ls_sql+=" FROM cw_fkcs,cw_fkfamx,cw_fkfabm  ";
    ls_sql+=" where cw_fkfamx.fkcs=cw_fkcs.fkcs(+) and cw_fkfamx.fkfabm=cw_fkfabm.fkfabm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_fkfamx.fkfabm,cw_fkfamx.fkcs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_fkfamxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"fkfamc","fkcsmc","lx","sfsjfsesk","sfbhgcf","sfbhjrqtf","sfbhbjrqtf","sfbhsjf","sfbhglf","sfbhsj","sfbhzcf","bqfkbl","yfkbl"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"fkfabm","fkcs"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("fkfamc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">�����</td>
	<td  width="8%">�տ�����</td>
	<td  width="18%">�տʽ</td>
	<td  width="6%">�Ƿ�ʵ�ʷ����ܶ��տ�</td>
	<td  width="7%">�Ƿ񺬹��̷�</td>
	<td  width="7%">�Ƿ񺬼�ҵ��������</td>
	<td  width="7%">�Ƿ񺬲���ҵ��������</td>
	<td  width="6%">�Ƿ���Ʒ�</td>
	<td  width="7%">�տ��Ƿ���������</td>
	<td  width="6%">�տ��Ƿ����˰��</td>
	<td  width="6%">�Ƿ����ķ�</td>
	<td  width="6%">�����տ���ʣ�%��</td>
	<td  width="6%">�ۼ��տ���ʣ�%��</td>
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