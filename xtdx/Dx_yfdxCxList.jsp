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

	String jshm=null;
	String fcsj=null;
	String fsr=null;
	String fsfs=null;
	String fsjg=null;

	String sfcg=null;
	sfcg=request.getParameter("sfcg");
	if (sfcg!=null)
	{
		sfcg=cf.GB2Uni(sfcg);
		if (sfcg.equals("Y"))
		{
			wheresql+=" and fsjg=1";
		}
		else{
			wheresql+=" and fsjg!=1";
		}

	}

	jshm=request.getParameter("jshm");
	if (jshm!=null)
	{
		jshm=cf.GB2Uni(jshm);
		if (!(jshm.equals("")))	wheresql+=" and  (jshm='"+jshm+"')";
	}
	fcsj=request.getParameter("fcsj");
	if (fcsj!=null)
	{
		fcsj=fcsj.trim();
		if (!(fcsj.equals("")))	wheresql+="  and (fcsj>=TO_DATE('"+fcsj+"','YYYY/MM/DD'))";
	}
	fcsj=request.getParameter("fcsj2");
	if (fcsj!=null)
	{
		fcsj=fcsj.trim();
		if (!(fcsj.equals("")))	wheresql+="  and (fcsj<=TO_DATE('"+fcsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	fsr=request.getParameter("fsr");
	if (fsr!=null)
	{
		fsr=cf.GB2Uni(fsr);
		if (!(fsr.equals("")))	wheresql+=" and  (fsr='"+fsr+"')";
	}
	fsfs=request.getParameter("fsfs");
	if (fsfs!=null)
	{
		fsfs=cf.GB2Uni(fsfs);
		if (!(fsfs.equals("")))	wheresql+=" and  (fsfs='"+fsfs+"')";
	}
	fsjg=request.getParameter("fsjg");
	if (fsjg!=null)
	{
		fsjg=cf.GB2Uni(fsjg);
		if (!(fsjg.equals("")))	wheresql+=" and  (fsjg='"+fsjg+"')";
	}

	ls_sql="SELECT xh,jshm,to_char(fcsj,'yyyy-MM-dd hh24:mi:ss') fcsj,fsr,DECODE(fsfs,'1','�˹�����','0','��ʱ����') fsfs,DECODE(fsjg,1,'���ͳɹ�',-100,'����ʧ��',-2,'����������',-3,'�û��������벻��ȷ',-4,'�û��˺�����',8,'δ֪ԭ��ʧ��',9,'�޷���ֵ'),dxnr  ";
	ls_sql+=" FROM dx_yfdx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	ls_sql+=" order by xh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Dx_yfdxCxList.jsp","SelectCxDx_yfdx.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

	pageObj.alignStr[6]="align='left'";

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
  <B><font size="3">���ŷ��ͼ�¼��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���</td>
	<td  width="11%">�ֻ�����</td>
	<td  width="18%">����ʱ��</td>
	<td  width="7%">������</td>
	<td  width="8%">���ͷ�ʽ</td>
	<td  width="10%">���ͽ��</td>
	<td  width="40%">��������</td>
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