<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;


	ls_sql="SELECT crm_htshmx.khbh as khbh,crm_htshmx.shxmbm as shxmbm,dm_shxmbm.shxmmc as dm_shxmbm_shxmmc,dm_shxmdlbm.shxmdlmc as dm_shxmdlbm_shxmdlmc,dm_shxmxlbm.shxmxlmc as dm_shxmxlbm_shxmxlmc,crm_htshmx.bhgsl as crm_htshmx_bhgsl,TO_CHAR(crm_htshmx.kf) as crm_htshmx_kf,crm_htshmx.bhgsl*crm_htshmx.kf zf ";
	ls_sql+=" FROM dm_shxmxlbm,dm_shxmdlbm,dm_shxmbm,crm_htshmx  ";
    ls_sql+=" where dm_shxmbm.shxmxlbm=dm_shxmxlbm.shxmxlbm and dm_shxmbm.shxmdlbm=dm_shxmdlbm.shxmdlbm and  crm_htshmx.shxmbm=dm_shxmbm.shxmbm";
    ls_sql+=" and crm_htshmx.khbh='"+khbh+"'";
    ls_sql+=" order by dm_shxmbm.shxmdlbm,dm_shxmbm.shxmxlbm,crm_htshmx.shxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_htshmxList.jsp?khbh="+khbh,"","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"dm_shxmdlbm_shxmdlmc","dm_shxmxlbm_shxmxlmc","dm_shxmbm_shxmmc","crm_htshmx_bhgsl","crm_htshmx_kf","zf"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"khbh","shxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_htshmxList.jsp?khbh="+khbh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dm_shxmdlbm_shxmdlmc","1");//�в����������Hash��
	spanColHash.put("dm_shxmxlbm_shxmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from crm_htshmx where "+chooseitem;

		sql[1]="update crm_khxx set htshdf=NVL((select sum(bhgsl*kf) from  crm_htshmx where khbh='"+khbh+"'),0)";
		sql[1]+=" where khbh='"+khbh+"'";

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
	<td  width="6%">&nbsp;</td>
	<td  width="14%">�����Ŀ����</td>
	<td  width="18%">�����ĿС��</td>
	<td  width="36%">���ϸ���Ŀ</td>
	<td  width="10%">���ϸ���</td>
	<td  width="8%">����۷�</td>
	<td  width="8%">�ܷ�</td>
</tr>
<%
	pageObj.printDateSum();
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