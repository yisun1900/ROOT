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
	String kp_pdkpjl_kpjlh=null;
	String kp_pdkpjl_fgsbh=null;
	String kp_pdkpjl_qssj=null;
	String kp_pdkpjl_jzsj=null;
	String kp_pdkpjl_lrr=null;
	String kp_pdkpjl_lrsj=null;
	String kp_pdkpjl_zxbz=null;
	kp_pdkpjl_kpjlh=request.getParameter("kp_pdkpjl_kpjlh");
	if (kp_pdkpjl_kpjlh!=null)
	{
		kp_pdkpjl_kpjlh=cf.GB2Uni(kp_pdkpjl_kpjlh);
		if (!(kp_pdkpjl_kpjlh.equals("")))	wheresql+=" and  (kp_pdkpjl.kpjlh='"+kp_pdkpjl_kpjlh+"')";
	}
	kp_pdkpjl_fgsbh=request.getParameter("kp_pdkpjl_fgsbh");
	if (kp_pdkpjl_fgsbh!=null)
	{
		kp_pdkpjl_fgsbh=cf.GB2Uni(kp_pdkpjl_fgsbh);
		if (!(kp_pdkpjl_fgsbh.equals("")))	wheresql+=" and  (kp_pdkpjl.fgsbh='"+kp_pdkpjl_fgsbh+"')";
	}
	kp_pdkpjl_qssj=request.getParameter("kp_pdkpjl_qssj");
	if (kp_pdkpjl_qssj!=null)
	{
		kp_pdkpjl_qssj=kp_pdkpjl_qssj.trim();
		if (!(kp_pdkpjl_qssj.equals("")))	wheresql+="  and (kp_pdkpjl.qssj=TO_DATE('"+kp_pdkpjl_qssj+"','YYYY/MM/DD'))";
	}
	kp_pdkpjl_jzsj=request.getParameter("kp_pdkpjl_jzsj");
	if (kp_pdkpjl_jzsj!=null)
	{
		kp_pdkpjl_jzsj=kp_pdkpjl_jzsj.trim();
		if (!(kp_pdkpjl_jzsj.equals("")))	wheresql+="  and (kp_pdkpjl.jzsj=TO_DATE('"+kp_pdkpjl_jzsj+"','YYYY/MM/DD'))";
	}
	kp_pdkpjl_lrr=request.getParameter("kp_pdkpjl_lrr");
	if (kp_pdkpjl_lrr!=null)
	{
		kp_pdkpjl_lrr=cf.GB2Uni(kp_pdkpjl_lrr);
		if (!(kp_pdkpjl_lrr.equals("")))	wheresql+=" and  (kp_pdkpjl.lrr='"+kp_pdkpjl_lrr+"')";
	}
	kp_pdkpjl_lrsj=request.getParameter("kp_pdkpjl_lrsj");
	if (kp_pdkpjl_lrsj!=null)
	{
		kp_pdkpjl_lrsj=kp_pdkpjl_lrsj.trim();
		if (!(kp_pdkpjl_lrsj.equals("")))	wheresql+="  and (kp_pdkpjl.lrsj=TO_DATE('"+kp_pdkpjl_lrsj+"','YYYY/MM/DD'))";
	}
	kp_pdkpjl_zxbz=request.getParameter("kp_pdkpjl_zxbz");
	if (kp_pdkpjl_zxbz!=null)
	{
		kp_pdkpjl_zxbz=cf.GB2Uni(kp_pdkpjl_zxbz);
		if (!(kp_pdkpjl_zxbz.equals("")))	wheresql+=" and  (kp_pdkpjl.zxbz='"+kp_pdkpjl_zxbz+"')";
	}
	ls_sql="SELECT kp_pdkpjl.kpjlh,sq_dwxx.dwmc,kp_pdkpjl.qssj,kp_pdkpjl.jzsj,kp_pdkpjl.lrr,kp_pdkpjl.lrsj, DECODE(kp_pdkpjl.zxbz,'Y','����','N','������'),kp_pdkpjl.bz  ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx  ";
    ls_sql+=" where kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+) and kp_pdkpjl.zxbz='Y'";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pdkpjl.lrsj desc,kp_pdkpjl.kpjlh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_pdkpjlRgdfList.jsp","SelectRgdfKp_pdkpjl.jsp","LoadData.jsp","InsertKp_pdkprgdf.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpjlh","sq_dwxx_dwmc","kp_pdkpjl_qssj","kp_pdkpjl_jzsj","kp_pdkpjl_sgdpdze","kp_pdkpjl_lrr","kp_pdkpjl_lrsj","kp_pdkpjl_zxbz","kp_pdkpjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kpjlh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("Excel");//����ÿҳ��ʾ��¼��
	pageObj.setViewBolt("");//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("¼��");//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
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
  <B><font size="3">�����˹����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">&nbsp;</td>
	<td  width="9%">������¼��</td>
	<td  width="12%">�ֹ�˾</td>
	<td  width="9%">������ʼʱ��</td>
	<td  width="9%">������ֹʱ��</td>
	<td  width="7%">¼����</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="8%">���±�־</td>
	<td  width="28%">��ע</td>
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