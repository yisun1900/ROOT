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
	ls_sql="SELECT kp_pdkpjl.kpjlh, DECODE(kp_pdkpjl.zxbz,'Y','����','N','������'),sq_dwxx.dwmc,kp_pdkpjl.qssj,kp_pdkpjl.jzsj,kp_pdkpjl.kxsgds,kp_pdkpjl.sgdpdze,kp_pdkpjl.ajqz,kp_pdkpjl.bjqz,kp_pdkpjl.cjqz,kp_pdkpjl.djqz,kp_pdkpjl.ajddbl||'%',kp_pdkpjl.ajzdbl||'%',kp_pdkpjl.ajxdbl||'%',kp_pdkpjl.bjddbl||'%',kp_pdkpjl.bjzdbl||'%',kp_pdkpjl.bjxdbl||'%',kp_pdkpjl.cjddbl||'%',kp_pdkpjl.cjzdbl||'%',kp_pdkpjl.cjxdbl||'%',kp_pdkpjl.djddbl||'%',kp_pdkpjl.djzdbl||'%',kp_pdkpjl.djxdbl||'%',kp_pdkpjl.ajzdjde,kp_pdkpjl.bjzdjde,kp_pdkpjl.cjzdjde,kp_pdkpjl.djzdjde   ,kp_pdkpjl.sgdpkzf,kp_pdkpjl.mfkjde   ,kp_pdkpjl.zsdpdze,kp_pdkpjl.zsajqz,kp_pdkpjl.zsbjqz,kp_pdkpjl.zscjqz,kp_pdkpjl.zsdjqz,kp_pdkpjl.zsajddbl||'%',kp_pdkpjl.zsajzdbl||'%',kp_pdkpjl.zsajxdbl||'%',kp_pdkpjl.zsbjddbl||'%',kp_pdkpjl.zsbjzdbl||'%',kp_pdkpjl.zsbjxdbl||'%',kp_pdkpjl.zscjddbl||'%',kp_pdkpjl.zscjzdbl||'%',kp_pdkpjl.zscjxdbl||'%',kp_pdkpjl.zsdjddbl||'%',kp_pdkpjl.zsdjzdbl||'%',kp_pdkpjl.zsdjxdbl||'%'   ,kp_pdkpjl.zsajzdjde,kp_pdkpjl.zsbjzdjde,kp_pdkpjl.zscjzdjde,kp_pdkpjl.zsdjzdjde   ,kp_pdkpjl.zsdkpzf,kp_pdkpjl.zsmfkjde,kp_pdkpjl.lrr,kp_pdkpjl.lrsj,kp_pdkpjl.bz  ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx  ";
    ls_sql+=" where kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pdkpjl.lrsj desc,kp_pdkpjl.kpjlh desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Kp_pdkpjlCxList.jsp","SelectCxKp_pdkpjl.jsp","","DyKp_pdkpjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"kpjlh","sq_dwxx_dwmc","kp_pdkpjl_qssj","kp_pdkpjl_jzsj","kp_pdkpjl_sgdpdze","kp_pdkpjl_ajqz","kp_pdkpjl_bjqz","kp_pdkpjl_cjqz","kp_pdkpjl_djqz","kp_pdkpjl_ajddbl","kp_pdkpjl_ajzdbl","kp_pdkpjl_ajxdbl","kp_pdkpjl_bjddbl","kp_pdkpjl_bjzdbl","kp_pdkpjl_bjxdbl","kp_pdkpjl_cjddbl","kp_pdkpjl_cjzdbl","kp_pdkpjl_cjxdbl","kp_pdkpjl_djddbl","kp_pdkpjl_djzdbl","kp_pdkpjl_djxdbl","kp_pdkpjl_ajzdjde","kp_pdkpjl_bjzdjde","kp_pdkpjl_cjzdjde","kp_pdkpjl_djzdjde","kp_pdkpjl_sgdpkzf","kp_pdkpjl_mfkjde","kp_pdkpjl_zsdpdze","kp_pdkpjl_zsajqz","kp_pdkpjl_zsbjqz","kp_pdkpjl_zsajddbl","kp_pdkpjl_zsajzdbl","kp_pdkpjl_zsajxdbl","kp_pdkpjl_zsbjddbl","kp_pdkpjl_zsbjzdbl","kp_pdkpjl_zsbjxdbl","kp_pdkpjl_zsajzdjde","kp_pdkpjl_zsbjzdjde","kp_pdkpjl_zsdkpzf","kp_pdkpjl_zsmfkjde","kp_pdkpjl_lrr","kp_pdkpjl_lrsj","kp_pdkpjl_zxbz","kp_pdkpjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kpjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("��ӡ");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"kpjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_pdkpjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("kpjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
  <B><font size="3">�ɵ�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(450);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="40">&nbsp;</td>
	<td  width="70">������¼��</td>
	<td  width="70">���±�־</td>
	<td  width="120">�ֹ�˾</td>
	<td  width="90">������ʼʱ��</td>
	<td  width="90">������ֹʱ��</td>
	<td  width="70">�ɵ���ѡʩ������</td>
	<td  width="90">��ֱ�����ɵ��ܶ��</td>
	<td  width="70">A����Ȩ��</td>
	<td  width="70">B����Ȩ��</td>
	<td  width="70">C����Ȩ��</td>
	<td  width="70">D����Ȩ��</td>
	<td  width="70">A���ӽӴ󵥱���</td>
	<td  width="70">A���ӽ��е�����</td>
	<td  width="70">A���ӽ�С������</td>
	<td  width="70">B���ӽӴ󵥱���</td>
	<td  width="70">B���ӽ��е�����</td>
	<td  width="70">B���ӽ�С������</td>
	<td  width="70">C���ӽӴ󵥱���</td>
	<td  width="70">C���ӽ��е�����</td>
	<td  width="70">C���ӽ�С������</td>
	<td  width="70">D���ӽӴ󵥱���</td>
	<td  width="70">D���ӽ��е�����</td>
	<td  width="70">D���ӽ�С������</td>
	<td  width="70">A���ӵ������ӵ���</td>
	<td  width="70">B���ӵ������ӵ���</td>
	<td  width="70">C���ӵ������ӵ���</td>
	<td  width="70">D���ӵ������ӵ���</td>

	<td  width="70">��ֱ���ӿ����ܷ�</td>
	<td  width="70">��ֱ����ÿ�ֵĿɽӵ���</td>

	<td  width="90">ֱ�����ɵ��ܶ��</td>
	<td  width="70">ֱ��A����Ȩ��</td>
	<td  width="70">ֱ��B����Ȩ��</td>
	<td  width="70">ֱ��C����Ȩ��</td>
	<td  width="70">ֱ��D����Ȩ��</td>
	<td  width="70">ֱ��A���ӽӴ󵥱���</td>
	<td  width="70">ֱ��A���ӽ��е�����</td>
	<td  width="70">ֱ��A���ӽ�С������</td>
	<td  width="70">ֱ��B���ӽӴ󵥱���</td>
	<td  width="70">ֱ��B���ӽ��е�����</td>
	<td  width="70">ֱ��B���ӽ�С������</td>
	<td  width="70">ֱ��C���ӽӴ󵥱���</td>
	<td  width="70">ֱ��C���ӽ��е�����</td>
	<td  width="70">ֱ��C���ӽ�С������</td>
	<td  width="70">ֱ��D���ӽӴ󵥱���</td>
	<td  width="70">ֱ��D���ӽ��е�����</td>
	<td  width="70">ֱ��D���ӽ�С������</td>
	<td  width="70">ֱ��A���ӵ������ӵ���</td>
	<td  width="70">ֱ��B���ӵ������ӵ���</td>
	<td  width="70">ֱ��C���ӵ������ӵ���</td>
	<td  width="70">ֱ��D���ӵ������ӵ���</td>
	<td  width="70">ֱ���ӿ����ܷ�</td>
	<td  width="70">ֱ����ÿ�ֵĿɽӵ���</td>
	<td  width="70">¼����</td>
	<td  width="90">¼��ʱ��</td>
	<td  width="280">��ע</td>
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